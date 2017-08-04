FROM alpine:3.6
MAINTAINER kebyn <kebyn@sina.com>

RUN set -ex \
    && apk --no-cache add \
    wget \
    ca-certificates \
    python3-dev \
    gcc \
    musl-dev \
    lcms2-dev \
    jpeg-dev \
    zlib-dev \
    freetype-dev \
    openjpeg-dev \
    tiff-dev \
    libffi-dev \
    tk-dev \
    && apk --no-cache add --update openssl \
    && mkdir -p /opt/ehForwarderBot/storage \
    && chmod +rw /opt/ehForwarderBot/storage \
    && wget https://bootstrap.pypa.io/get-pip.py \
    && python3 get-pip.py \
    && rm -f get-pip.py

WORKDIR /opt/ehForwarderBot

ENV VERSION 1.6.4

RUN set -ex \
    && wget https://github.com/blueset/ehForwarderBot/archive/v$VERSION.tar.gz -O ehForwarderBot.tar.gz \
    && tar xvf ehForwarderBot.tar.gz --strip-components=1 \
    && rm -f ehForwarderBot.tar.gz \
    && pip3 install -r requirements.txt \
    && rm -rf /root/.cache \
    && apk del gcc wget

VOLUME /opt/ehForwarderBot/plugins/eh_telegram_master/tgdata.db

ENTRYPOINT ["python3", "main.py"]
