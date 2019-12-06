#!/bin/bash

mkdir -p bin
mkdir -p lib

docker build -t builder . && \
docker run \
  --mount type=bind,source="$(pwd)"/bin,target=/home/conan/build/bin \
  --mount type=bind,source="$(pwd)"/lib,target=/home/conan/build/lib \
  builder
