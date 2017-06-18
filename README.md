# Docker PlatformIO Core
This is a Dockerfile packaging [PlatformIO](http://platformio.org/) Core. The image contains the PlatformIO Command Line Interface for developing software for embedded devices and IoT projects. 
To speedup development, this image has the platform espressif8266 already installed.

## Usage
Add the script platformio.sh to your path and run platformio < options >.
### Step By Step
Pull the image
```
pull sglahn/docker-platformio-core:latest
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
    run -t upload
```
## Keep Configuration
If you want to keep the downloaded packages, etc. you can save the PlatformIO configuration outside of the container. You can do this by adding the following line to the docker run call:
```
-v `$HOME/.platformio`:/.platformio \
```
This will install the package in your home directory. Alternatively you could use a Data Volume Container to save the PlatformIO configuration. First create the Data Volume Container
```
docker run --name vc_platformio sglahn/vc_platformio:latest
```
Then add the following line to the docker run call:
```
--volumes-from=vc_platformio \
```


