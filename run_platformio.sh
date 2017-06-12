#!/bin/bash

CONTAINER_NAME=platformio-core
IMAGE_NAME=sglahn/platformio-core:3.3.1

if [ ! "$(docker ps -a | grep $CONTAINER_NAME)" ]; then
    echo "Creating new container"
    docker create -i --tty \
            -v ~/Workspace/Microcontroller:/workspace \
            -u `id -u $USER`:`id -g $USER` \
            --device=/dev/ttyUSB0 \
            --name $CONTAINER_NAME \
            $IMAGE_NAME
fi
docker start -i $CONTAINER_NAME

