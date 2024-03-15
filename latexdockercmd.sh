#!/bin/sh

IMAGE=texlive/texlive:TL2022-historic
docker run --rm  --user="$(id -u):$(id -g)" --net=none -w /data/ -v`pwd`:/data -e TERM=xterm-256color $IMAGE make all
