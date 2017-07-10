FROM python:2.7
MAINTAINER Sebastian Glahn "hi@sgla.hn"

ENV APP_VERSION="3.3.1" \
    APP="platformio"

LABEL app.name="platformio-core" \
      app.version="${APP_VERSION}"

RUN pip install -U platformio==3.3.1 && \
    platformio platform install espressif8266 && \
    mkdir -p /workspace

WORKDIR /workspace

ENTRYPOINT ["platformio"] 
