#!/usr/bin/env bash

IMAGE="$1"
SIZES=("300" "618" "846" "1035" "1223" "1280")
FILENAME=$(basename -- "$IMAGE")
EXTENSION="${FILENAME##*.}"

log_info() {
  local MESSAGE=$1
  echo "----> $MESSAGE"
}

log_error() {
  local MESSAGE=$1
  echo "!! $MESSAGE"
}

if [[ "$EXTENSION" == "jpg" ]]; then
  log_info "Resizing $IMAGE"
  for size in "${SIZES[@]}"; do
    convert "$IMAGE" \
      -resize "$size" \
      -set filename:t '%d/resized/%t'"-$size" '%[filename:t].jpg'
  done
else
  log_error "Not a jpg image"
  exit 1
fi
