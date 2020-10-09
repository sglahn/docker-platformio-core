FROM python:3.9.0-slim

ENV APP_VERSION="5.0.1" \
    APP="platformio-core"

LABEL app.name="${APP}" \
      app.version="${APP_VERSION}" \
      maintainer="Sebastian Glahn <hi@sgla.hn>"

RUN pip install -U platformio==${APP_VERSION} && \
    mkdir -p /workspace && \
    mkdir -p /.platformio && \
    chmod a+rwx /.platformio

USER 1001

WORKDIR /workspace

ENTRYPOINT ["platformio"] 

