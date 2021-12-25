FROM ubuntu:20.04
LABEL maintainer="theypsilon@gmail.com"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    python \
    libfontconfig-dev \
    qt5-default \
    libsdl2-dev \
    libsdl2-ttf-dev \
    coreutils \
    unzip \
    curl
ARG MAME_VERSION
RUN curl \
    -ksL \
    -o /tmp/mame.zip \
    https://github.com/mamedev/mame/archive/refs/tags/mame${MAME_VERSION}.zip \
  && unzip /tmp/mame.zip -d /tmp \
  && mv /tmp/mame-mame${MAME_VERSION} /build \
  && rm /tmp/mame.zip
RUN cd /build && \
    make

