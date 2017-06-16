#!/bin/bash

IMAGE_NAME=sglahn/platformio-core:3.3.1

docker run --rm \
    -v `pwd`:/workspace \
    -u `id -u $USER`:`id -g $USER` \
    --device=/dev/ttyUSB0 \
    $IMAGE_NAME \
    $@

