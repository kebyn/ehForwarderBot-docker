FROM alpine:latest
MAINTAINER kebyn <kebyn@sina.com>

ENV LANG C.UTF-8
ENV TZ Asia/Shanghai

RUN set -ex \
   && apk --no-cache add \
      python3 \
      libmagic \
      ffmpeg \
      py3-numpy \
      py3-pillow \
      gcc \
      python3-dev \
      musl-dev \
      libffi-dev \
      openssl-dev \
   && apk add --update --no-cache --virtual .deps \
      tar \
      git \
   && git clone -b v1 https://github.com/blueset/ehForwarderBot.git /opt/ehForwarderBot \
   && mkdir -p /opt/ehForwarderBot/storage \
   && chmod +rw /opt/ehForwarderBot/storage
   

WORKDIR /opt/ehForwarderBot

RUN set -ex \
   && pip3 install -r requirements.txt \
   && rm -rf /root/.cache \
   && apk del .deps

VOLUME /opt/ehForwarderBot/plugins/eh_telegram_master/tgdata.db

ENTRYPOINT ["python3", "main.py"]
