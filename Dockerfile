FROM python:2.7
MAINTAINER Sebastian Glahn "hi@sgla.hn"

ENV APP_VERSION="3.6.7" \
    APP="platformio"

LABEL app.name="platformio-core" \
      app.version="${APP_VERSION}"

RUN pip install -U ${APP}==${APP_VERSION} && \
    mkdir -p /workspace

WORKDIR /workspace

ENTRYPOINT ["platformio"] 
