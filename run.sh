#!/bin/sh

set -eux

DIR=$(dirname "$0")
DIR=$(realpath $DIR)

docker run -it --rm -v $(realpath "$DIR/.."):/src \
    -v "$DIR/cache":/cache \
    -v "$DIR/cache/xdg/data":/root/.local/share \
    -v "$DIR/cache/xdg/state":/root/.local/state \
    -v "$DIR/cache/xdg/cache":/root/.cache \
    -v "$DIR/cache/xdg/config":/root/.config \
    rust:local
