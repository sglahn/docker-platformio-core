#!/bin/bash

IMAGE_NAME=571710e11420
#IMAGE_NAME=sglahn/platformio-core:3.3.1

docker run --rm \
    -v `pwd`:/workspace \
    -v "$HOME"/.platformio:/.platformio \
    -u `id -u $USER`:`id -g $USER` \
    --device=/dev/ttyUSB0 \
    $IMAGE_NAME \
    $@

