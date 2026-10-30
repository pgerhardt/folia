#!/bin/sh
# Run from any directory. Requires a modern TeX distribution with TikZ.
set -eu
cd "$(dirname "$0")"
mkdir -p build
pdflatex -no-shell-escape -interaction=nonstopmode -halt-on-error -jobname=sample-resume -output-directory=build main.tex
pdflatex -no-shell-escape -interaction=nonstopmode -halt-on-error -jobname=sample-resume -output-directory=build main.tex
cp build/sample-resume.pdf sample-resume.pdf
printf '\nCreated sample-resume.pdf\n'
