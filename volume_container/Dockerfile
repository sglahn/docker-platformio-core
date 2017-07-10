FROM busybox:latest
MAINTAINER Sebastian Glahn "hi@sgla.hn"

RUN mkdir -p /.platformio && \
    chmod 777 /.platformio

VOLUME ["/.platformio"]

CMD ["echo", "Volume container initialized."]

