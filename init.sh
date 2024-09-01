#!/bin/sh

set -eux

DIR=$(dirname "$0")
DIR=$(realpath $DIR)

rm -rf $DIR/cache

mkdir -p $DIR/cache/xdg
mkdir -p $DIR/cache/xdg/data
mkdir -p $DIR/cache/xdg/state
mkdir -p $DIR/cache/xdg/cache

git -C $DIR clone -b local git@github.com:cjkoss/local-nvim-config.git \
    $DIR/cache/xdg/config/nvim

docker build -t rust:local $DIR 

sh $DIR/run.sh
