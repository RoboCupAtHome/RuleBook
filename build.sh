#!/bin/sh

IMAGE=docker.io/texlive/texlive:TL2022-historic

if command -v podman >/dev/null 2>&1
then
    podman run --rm --net=none -w /data/ -v`pwd`:/data -e TERM=xterm-256color $IMAGE make rulebook scoresheets
else
    docker run --rm --user="$(id -u):$(id -g)" --net=none -w /data/ -v`pwd`:/data -e TERM=xterm-256color $IMAGE make rulebook scoresheets
fi

