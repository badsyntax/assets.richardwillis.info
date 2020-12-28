#!/usr/bin/env bash

IMAGE="$1"
SIZES=("640" "768" "1024" "1280")
FILENAME=$(basename -- "$IMAGE")
EXTENSION="${FILENAME##*.}"

log_info_main() {
  local MESSAGE=$1
  echo "--> $MESSAGE"
}

log_info() {
  local MESSAGE=$1
  echo "----> $MESSAGE"
}

log_error() {
  local MESSAGE=$1
  echo "!! $MESSAGE"
}

if [[ "$EXTENSION" == "jpg" ]]; then
  log_info_main "Generating images for $IMAGE"
  for size in "${SIZES[@]}"; do
    convert "$IMAGE" \
      -resize "$size" \
      -interlace Plane \
      -quality 85 \
      -strip \
      -set filename:t '%d/resized/%t'"-$size" '%[filename:t].jpg'
    log_info "Generated resized jpg for $size"
    convert "$IMAGE" \
      -resize "$size" \
      -quality 85 \
      -strip \
      -set filename:t '%d/resized/%t'"-$size" '%[filename:t].webp'
    log_info "Generated resized webp for $size"
  done
  log_info_main "All Done!"
else
  log_error "Not a jpg image"
  exit 1
fi
