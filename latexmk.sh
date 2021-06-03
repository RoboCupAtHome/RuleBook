#!/bin/sh
export PATH=$PATH:/usr/local/texlive/2019/bin/x86_64-linux
latexmk -f --pdf --quiet -synctex=1 -output-directory=./.workspace/ main.tex
