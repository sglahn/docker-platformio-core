FROM python:3.7-slim

ENV APP_VERSION="4.0.0" \
    APP="platformio-core"

LABEL app.name="${APP}" \
      app.version="${APP_VERSION}" \
      maintainer="Sebastian Glahn <hi@sgla.hn>"

RUN pip install -U platformio==${APP_VERSION} && \
    mkdir -p /workspace && \
    mkdir -p /.platformio && \
    chmod a+rwx /.platformio

USER 1001

RUN platformio settings set enable_telemetry No && \
    platformio settings set enable_ssl Yes && \
    platformio settings set auto_update_libraries Yes && \
    platformio settings set auto_update_platforms Yes

WORKDIR /workspace

ENTRYPOINT ["platformio"] 

