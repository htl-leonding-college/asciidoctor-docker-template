set -e
BUILD_DIR="build-docs-pdf"
rm -rf -v $BUILD_DIR # else plantuml diagrams won't be rebuilt
cp -r -p -v asciidocs $BUILD_DIR
# when you want to include source-code, so uncomment the follwing command with the correct path of the sourcecode
#cp -r -p -v src $BUILD_DIR
docker run --rm \
           -v ${PWD}/$BUILD_DIR:/documents \
           asciidoctor/docker-asciidoctor asciidoctor-pdf \
           -r asciidoctor-diagram \
           -a icons=font \
           -a icons-set=fas \
           -a rouge-style=github \
           -a experimental=true \
           -a source-highlighter=rouge \
           -a imagesdir=images \
           -a toc=left \
           -a toclevels=2 \
           -a sectnums=true \
           -a sourcedir=src/main/java \
           -b pdf \
           '*.adoc'

# https://asciidoctor.org/docs/asciidoctor-pdf/
# https://share.stoeps.de/Froscon14-DocumentationWithAnyEditor.html
# https://docplayer.org/9293416-Asciidoctor-dokumentation-schreiben-kann-spass-machen.html
