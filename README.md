# Docker PlatformIO Core

Dockerfile for [PlatformIO](http://platformio.org/) Core, containing the platformio Command Line Interface for developing with embedded Devices and IoT projects. This image has the platform espressif8266 already installed.

## Usage
Pull the image
```
pull sglahn/platformio-core:latest
```
Create and start a Docker container
```
docker create -i --tty \
            -v <PROJECT_DIR>:/workspace \
            -u `id -u $USER`:`id -g $USER` \
            --device=/dev/ttyUSB0 \
            --name platformio
            sglahn/platformio-core:latest
docker start -i platformio
```
With <PROJECT_DIR> as the directory containing your work, e.g. ~/Workspace/. Now you can create a new project
```
platformio init --board uno
```
Compile
```
platformio run
```
And upload
```
platformio run -t upload
```