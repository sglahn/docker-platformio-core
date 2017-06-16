# Docker PlatformIO Core
This is a Dockerfile packaging [PlatformIO](http://platformio.org/) Core. The image contains the PlatformIO Command Line Interface for developing software for embedded devices and IoT projects. 
To speedup development, this image has the platform espressif8266 already installed.

## Usage
Pull the image
```
pull sglahn/platformio-core:latest
```
Run a Docker container
```
docker run --rm \
    -v <PROJECT_DIR>:/workspace \
    -u `id -u $USER`:`id -g $USER` \
    --device=/dev/ttyUSB0 \
    sglahn/platformio-core:latest \
```
With <PROJECT_DIR> as the directory containing your work, e.g. ~/Workspace/myproject/.

## Examples
 With this Docker image you can for example, create a new project:
```
docker run --rm \
    -v `pwd`:/workspace \
    -u `id -u $USER`:`id -g $USER` \
    --device=/dev/ttyUSB0 \
    sglahn/platformio-core:latest \
    init --board uno
```
Compile a project:
```
docker run --rm \
    -v `pwd`:/workspace \
    -u `id -u $USER`:`id -g $USER` \
    --device=/dev/ttyUSB0 \
    sglahn/platformio-core:latest \
    run
```
Or upload your project to a board connected to the PC:
```
docker run --rm \
    -v `pwd`:/workspace \
    -u `id -u $USER`:`id -g $USER` \
    --device=/dev/ttyUSB0 \
    sglahn/platformio-core:latest \
    upload
```
