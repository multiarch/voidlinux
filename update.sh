#!/bin/sh -xe

if [ ! -f armhf-latest/qemu-arm-static ]; then (
    cd armhf-latest
    wget -N https://github.com/multiarch/qemu-user-static/releases/download/v2.5.0/x86_64_qemu-arm-static.tar.xz
    tar xf x86_64_qemu-arm-static.tar.xz
); fi
					       
docker build -t multiarch/voidlinux:armhf-latest armhf-latest
docker tag multiarch/voidlinux:armhf-latest multiarch/voidlinux:armhf
docker run -it --rm multiarch/voidlinux:armhf-latest uname -a

docker build -t multiarch/voidlinux:amd64-latest x86_64-latest
docker tag multiarch/voidlinux:amd64-latest multiarch/voidlinux:amd64
docker run -it --rm multiarch/voidlinux:amd64-latest uname -a
