# Docker PlatformIO Core
![Docker Pulls](https://img.shields.io/docker/pulls/sglahn/platformio-core.svg)

This is a Dockerfile packaging [PlatformIO](http://platformio.org/) Core. The image contains the PlatformIO Command Line Interface for developing software for embedded devices and IoT projects. 
To speedup development, this image has the platform espressif8266 already installed.

## Continuous Integration
### Github Actions
It is very easy to have CI features for your project using [GitHub Actions](https://github.com/features/actions) and this Docker image. To set this up, create a file called build.yml in the folder .github/workflows and add the following content:
```
name: Build

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v2
      - uses: docker://sglahn/platformio-core:latest
        with:
          args: run
```
This will trigger a build with platformio-core on every push in every branch.

### Jenkins Pipeline
Here is a very simple [Jenkins pipeline](https://www.jenkins.io/doc/book/pipeline/) example:
```
pipeline {
    agent any
    triggers { cron('H 4/* 0 0 1-5') }

    stages {
        stage('Build') {
            steps {
                git 'https://github.com/platformio/platformio-examples.git'

                sh 'docker run --rm \
                    --mount type=bind,source="$(pwd)/wiring-blink",target=/workspace \
                    -u `id -u $USER`:`id -g $USER` \
                    sglahn/platformio-core:latest \
                    run'
            }
        }
    }
}
```
Jenkins will periodically poll the SCM repository for changes and trigger a build with platformio-core.

## Manual Usage
Add the script platformio.sh to your path and run platformio < options >. 

### Uploading
For convenience, the script checks if the host device /dev/ttyUSB0 is available and adds this device to the Docker container. You can override this device by setting the environment variable UPLOAD_PORT.

## Step By Step
Pull the image
```
docker pull sglahn/platformio-core:latest
```
Run a Docker container
```
docker run --rm \
    --mount type=bind,source="$(pwd)",target=/workspace \
    -u `id -u $USER`:`id -g $USER` \
    --device=/dev/ttyUSB0 \
    sglahn/platformio-core:latest \
```
With <PROJECT_DIR> as the directory containing your work, e.g. ~/Workspace/myproject/.

## Examples
 With this Docker image you can for example, create a new project:
```
docker run --rm \
    --mount type=bind,source="$(pwd)",target=/workspace \
    -u `id -u $USER`:`id -g $USER` \
    sglahn/platformio-core:latest \
    init --board uno
```
Compile a project:
```
docker run --rm \
    --mount type=bind,source="$(pwd)",target=/workspace \
    -u `id -u $USER`:`id -g $USER` \
    --device=/dev/ttyUSB0 \
    sglahn/platformio-core:latest \
    run
```
Or upload your project to a board connected to the PC:
```
docker run --rm \
    --mount type=bind,source="$(pwd)",target=/workspace \
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
Alternatively you could use a data volume container to save the PlatformIO configuration. First create the data volume container
```
docker run --name vc_platformio sglahn/vc_platformio:latest
```
Then add the following line to the docker run call:
```
--volumes-from=vc_platformio \
```


