FROM python:2.7
MAINTAINER Sebastian Glahn "hi@sgla.hn"

ENV APP_VERSION="3.5.0" \
    APP="platformio"

LABEL app.name="platformio-core" \
      app.version="${APP_VERSION}"

RUN pip install -U platformio==3.5.0 && \
    mkdir -p /workspace

WORKDIR /workspace

ENTRYPOINT ["platformio"] 
