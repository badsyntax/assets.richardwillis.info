#!/usr/bin/env bash

IMAGE="$1"
SIZES=("420" "640" "768" "1024" "1280")
FILENAME=$(basename -- "$IMAGE")
EXTENSION="${FILENAME##*.}"

log-info-main() {
  local MESSAGE=$1
  echo "--> $MESSAGE"
}

log-info() {
  local MESSAGE=$1
  echo "----> $MESSAGE"
}

log-error() {
  local MESSAGE=$1
  echo "!! $MESSAGE"
}

get-resized-file-path() {
  local image
  image=$(basename "$1")
  local size="$2"
  local extension="$3"
  local newfile="./photos/resized/${image/%.jpg/-$size.$extension}"
  echo "$newfile"
}

get-resized-file-size() {
  local filename="$1"
  filesize=$(du -h "$filename" | cut -f 1)
  echo "$filesize"
}

resize-image() {
  local image="$1"
  local size="$2"
  local extension="$3"
  local args=${*:4}
  fullpath="$(get-resized-file-path "$IMAGE" "$size" "$extension")"
  # shellcheck disable=SC2086
  convert "$image" \
    -resize "$size" \
    -strip \
    $args \
    "$fullpath"
  filesize=$(get-resized-file-size "$fullpath")
  log-info "Generated $extension@$size ($filesize)"
}

if [[ "$EXTENSION" == "jpg" ]]; then
  log-info-main "Generating images for $IMAGE"
  for size in "${SIZES[@]}"; do
    resize-image "$IMAGE" "$size" jpg -interlace Plane -quality 85
    resize-image "$IMAGE" "$size" webp -quality 85
    resize-image "$IMAGE" "$size" avif -quality 85
  done
  log-info-main "All Done!"
else
  log-error "Not a jpg image"
  exit 1
fi
