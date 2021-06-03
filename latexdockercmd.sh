#!/bin/sh

if [ $# -lt 2 ]; then
  echo "usage: "
  echo "  "$0" [command] [filename]"
  echo "  Command uses https://github.com/blang/latex-docker see README for full details\n"
  echo "  quick pass:"
  echo "    "$0" pdflatex Rulebook.tex"
  echo "  full build:"
  echo "    "$0" /bin/sh -c \"pdflatex Rulebook.tex && makeindex Rulebook.tex && makeindex Rulebook.tex && pdflatex Rulebook.tex && pdflatex Rulebook.tex\""
  exit 1
fi

IMAGE=blang/latex:ubuntu
exec docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$PWD":/data "$IMAGE" "$@"