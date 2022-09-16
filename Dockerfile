FROM ubuntu:20.04

LABEL maintainer="BCadet <https://github.com/BCadet>"

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    gosu

RUN useradd --create-home builder

# setup entrypoint
ADD https://gist.githubusercontent.com/BCadet/372702916a20b141cb78ea889e3dae59/raw/73822ba555bfbd75ab7c09c90d463585535e5a0e/container-entrypoint /container-entrypoint

RUN chmod +x /container-entrypoint
ENTRYPOINT [ "/container-entrypoint" ]

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    bison \
    flex \
    gettext \
    texinfo \
    libncurses5-dev \
    libncursesw5-dev \
    gperf \
    automake \
    libtool \
    pkg-config \
    build-essential \
    gperf \
    genromfs \
    libgmp-dev \
    libmpc-dev \
    libmpfr-dev \
    libisl-dev \
    binutils-dev \
    libelf-dev \
    libexpat-dev \
    gcc-multilib \
    g++-multilib \
    picocom \
    u-boot-tools \
    util-linux \
    kconfig-frontends \
    git \
    sudo \
    gcc-arm-none-eabi \
    xxd \
    && rm -rf /var/lib/apt/lists/*
