#!/bin/sh -xe

if [ ! -f armhf-latest/qemu-arm-static ]; then (
    cd armhf-latest
    wget -N https://github.com/multiarch/qemu-user-static/releases/download/v2.5.0/x86_64_qemu-arm-static.tar.xz
    tar xf x86_64_qemu-arm-static.tar.xz
); fi
					       
docker build -t multiarch/voidlinux:armhf-latest armhf-latest
docker run -it --rm multiarch/voidlinux:armhf-latest uname -a
