#!/bin/bash

VOLUME_CONTAINER_NAME=vc_platformio
VOLUME_CONTAINER_IMAGE=sglahn/vc_platformio:latest
IMAGE_NAME=sglahn/platformio-core:3.3.1

if [ ! "$(docker ps -a | grep $VOLUME_CONTAINER_NAME)" ]; then
    docker run -u `id -u $USER`:`id -g $USER` --name $VOLUME_CONTAINER_NAME $VOLUME_CONTAINER_IMAGE
fi

docker run --rm \
    -v `pwd`:/workspace \
    --volumes-from=$VOLUME_CONTAINER_NAME \
    -u `id -u $USER`:`id -g $USER` \
    --device=/dev/ttyUSB0 \
    $IMAGE_NAME \
    $@
