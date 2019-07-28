FROM python:alpine
MAINTAINER kebyn <kebyn@sina.com>

ENV LANG C.UTF-8
ENV TZ Asia/Shanghai

RUN set -ex \
   && apk --no-cache add \
      python3-dev \
      libmagic \
      ffmpeg \
      py3-numpy \
      py3-pillow \
      py3-ruamel.yaml \
      git \
      gcc \
      zlib-dev \
      musl-dev \
      libffi-dev \
      openssl-dev \
      jpeg-dev \
   && apk add --update --no-cache --virtual .deps \
      curl \
      tar \
   && curl -sLq -o ehForwarderBot.tar.gz \
   $( \
   curl -s https://api.github.com/repos/blueset/ehForwarderBot/tags | \
   grep tarball_url | head -n 1 | awk -F'"' '{print $4}'\ 
   ) \
   && tar xf ehForwarderBot.tar.gz --strip-components=1 \
   && rm -f ehForwarderBot.tar.gz \
   && pip3 install efb-telegram-master \
   && pip3 install efb-wechat-slave \
   && mkdir -p /root/.ehforwarderbot/profiles/default/blueset.telegram \
   && apk del .deps

COPY config.yaml /root/.ehforwarderbot/profiles/default/

VOLUME /root/.ehforwarderbot/profiles/default/blueset.telegram

ENTRYPOINT ["ehforwarderbot"]