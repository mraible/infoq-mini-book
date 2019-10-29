#!/bin/bash
# Usage: `./generate-pdf.sh` to generate a printable 6x9" PDF with no syntax highlighting
#        `./generate-pdf.sh screen` to generate a downloadable 8.5x11" PDF

if [ -z `command -v bundle` ]; then
  echo Please install the bundler gem.
  exit 1
fi

if [ ! -d .bundle/gems ]; then
  rm -f Gemfile.lock
  bundle --path=.bundle/gems --binstubs=.bundle/.bin
fi

ASCIIDOCTOR_PDF=./.bundle/.bin/asciidoctor-pdf
HEXAPDF=./.bundle/.bin/hexapdf

ROOT_DIR=$(realpath $(dirname $0))
MEDIA=prepress
HIGHLIGHTING=""
if [ ! -z "$1" ]; then
  MEDIA=$1
  HIGHLIGHTING="-a source-highlighter=rouge"
fi
BASE_DIR="$ROOT_DIR/src/docs/asciidoc"
OUT_DIR="$ROOT_DIR/build/asciidoc/pdf-$MEDIA"

$ASCIIDOCTOR_PDF --trace -B "$BASE_DIR" \
  -D "$OUT_DIR" \
  -S unsafe \
  -r "$ROOT_DIR/src/main/ruby/asciidoctor-pdf-extensions.rb" \
  -a media=$MEDIA \
  -a pdfmarks \
  -a pdf-style=infoq-$MEDIA \
  -a pdf-stylesdir="$BASE_DIR/styles/pdf" \
  -a pdf-fontsdir="$BASE_DIR/styles/pdf/fonts" \
  -a sourcedir=../../../main/webapp \
  $HIGHLIGHTING \
  -a imagesdir=images \
  -a toc \
  -a icons=font \
  -a idprefix \
  -a idseparator=- \
  -a projectdir=../../.. \
  -a rootdir=../../.. \
  -a project-name=jhipster-book \
  -a project-version=2.0.0-SNAPSHOT \
  -a attribute-missing=warn \
  "$BASE_DIR/index.adoc"

$HEXAPDF optimize --force "$OUT_DIR/index.pdf" "$OUT_DIR/index.pdf"
