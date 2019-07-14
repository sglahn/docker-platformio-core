FROM python:3.7.4-alpine3.9

ENV APP_VERSION="4.0.0" \
    APP="platformio-core"

LABEL app.name="${APP}" \
      app.version="${APP_VERSION}" \
      maintainer="Sebastian Glahn <hi@sgla.hn>"

RUN pip install -U platformio==${APP_VERSION} && \
    mkdir -p /workspace && \
    mkdir -p /.platformio && \
    chmod a+rwx /.platformio

WORKDIR /workspace

ENTRYPOINT ["platformio"] 

USER 1001
