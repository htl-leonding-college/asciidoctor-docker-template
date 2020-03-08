set -e
BUILD_DIR="build-docs-revealjs"
[ ! -d "./asciidocs/revealjs" ] && source ./download-reveal.sh
rm -rf -v $BUILD_DIR # else plantuml diagrams won't be rebuilt
cp -r -p -v asciidocs $BUILD_DIR
cp -r -p -v src $BUILD_DIR
docker run --rm \
           -v ${PWD}/$BUILD_DIR:/documents \
           asciidoctor/docker-asciidoctor asciidoctor-revealjs \
           -r asciidoctor-diagram \
           -a icons=font \
           -a revealjs_theme=white \
           -a source-highlighter=rouge \
           -a imagesdir=images \
           -a revealjsdir=revealjs \
           -a revealjs_slideNumber=c/t \
           -a revealjs_transition=slide \
           -a revealjs_hash=true \
           -a sourcedir=src/main/java \
           -b revealjs \
           '*.adoc'

# https://asciidoctor.org/docs/asciidoctor-revealjs/

# revealjs_theme=[beige, black, league, night, serif, simple, sky, solarized, white]
# revealjs_transition [none, fade, slide, convex, concave, zoom]
# source-highlighter [highlightjs,rouge,coderay,prettify]

# https://asciidoctor.org/docs/user-manual/#highlight-js
#           -a highlightjs-theme=github \
#           -a highlightjsdir=highlight \
#           -a highlightjs-languages=java,yaml,json,asciidoc \
#           -a highlightjsdir=https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.18.1/build \

# Cheat Sheet
# https://powerman.name/doc/asciidoc