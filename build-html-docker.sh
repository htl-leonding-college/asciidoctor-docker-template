BUILD_DIR="build-docs-html"
rm -rf -v $BUILD_DIR # else plantuml diagrams won't be rebuilt
cp -r -p -v docs $BUILD_DIR
cp -r -p -v src $BUILD_DIR
docker run --rm \
           -v ${PWD}/$BUILD_DIR:/documents \
           asciidoctor/docker-asciidoctor asciidoctor \
           -r asciidoctor-diagram \
           -a icons=font \
           -a experimental=true \
           -a source-highlighter=rouge \
           -a imagesdir=images \
           -a toc=left \
           -a toclevels=2 \
           -a sectanchors=true \
           -a sectnums=true \
           -a favicon=themes/favicon.png \
           -a sourcedir=src/main/java \
           -b html5 \
           '*.adoc'

# https://github.com/asciidoctor/docker-asciidoctor

#           -a highlightjsdir=highlight \
#           -a highlightjs-theme=gruvbox-dark \