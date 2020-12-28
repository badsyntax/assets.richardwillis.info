#!/usr/bin/env bash

ROOT_MAX_SIZE="1400"

log_info_main() {
  local MESSAGE=$1
  echo "--> $MESSAGE"
}

log_info() {
  local MESSAGE=$1
  echo "----> $MESSAGE"
}

resize_root_images() {
  log_info_main "Resizing root images"
  for image in  photos/*.jpg; do
    log_info "Resizing $image"
    convert "$image" \
      -interlace plane \
      -resize "$ROOT_MAX_SIZE" "$image"
  done
  log_info_main "All Done!"
}

resize_root_images
