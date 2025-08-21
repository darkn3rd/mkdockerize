#!/bin/bash
set -euo pipefail

COMMAND=$1
shift || true

case "$COMMAND" in
  produce)
    # project directory as $1
    if [[ $# < 1 ]]; then
      echo "Usage: docker run ... <image> produce /path/to/mkdocs-project"
      exit 1
    fi
    PROJECT_DIR=$1
    tar -czf - -C "$PROJECT_DIR" .
    ;;
  serve)
    # .tar.gz from stdin
    mkdir -p /workspace/site
    tar -xzf - -C /workspace/site

    cd /workspace/site
    exec mkdocs serve -a 0.0.0.0:8000
    ;;
  *)
    echo "Unknown command: $COMMAND"
    echo "Usage: docker run ... <image> {produce|serve}"
    exit 1
    ;;
esac
