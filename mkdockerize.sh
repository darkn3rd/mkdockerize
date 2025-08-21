#!/bin/bash
set -euo pipefail

IMAGE_NAME="mkdockerize:latest"

build_image() {
  docker build -t "$IMAGE_NAME" .
}

produce() {
  if [[ $# < 1 ]]; then
    echo "Usage: $0 produce /path/to/mkdocs-project > project.tar.gz"
    exit 1
  fi
  docker run --rm -v "$1":/src "$IMAGE_NAME" produce /src
}

serve() {
  docker run --rm -i -p 8000:8000 "$IMAGE_NAME" serve
}

case "${1:-}" in
  build)
    build_image
    ;;
  produce)
    shift
    produce "$@"
    ;;
  serve)
    shift
    serve "$@"
    ;;
  *)
    echo "Usage: $0 {build|produce|serve}"
    exit 1
    ;;
esac
