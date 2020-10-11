set -e
# copy to gh-pages
BUILD_DIR="gh-pages"
rm -rf -v $BUILD_DIR # else plantuml diagrams won't be rebuilt
# do not copy revealjs
mkdir -p $BUILD_DIR
cp -r -p -v asciidocs/images $BUILD_DIR/images/
cp -r -p -v asciidocs/themes $BUILD_DIR
cp -r -p -v asciidocs/docinfo.html $BUILD_DIR
cp -r -p -v asciidocs/.nojekyll $BUILD_DIR
cp -r -p -v asciidocs/index.adoc $BUILD_DIR
cp -r -p -v asciidocs/*.adoc $BUILD_DIR
#uncomment it when you want to copy the source code into the gh-pages (for including source code into your document)
#cp -r -p -v src $BUILD_DIR

CURRENT_FOLDER=${PWD}
echo "pwd -> ${CURRENT_FOLDER}"
echo "adoc-folder->${CURRENT_FOLDER}/${BUILD_DIR}/*.adoc"
asciidoctor \
           -r asciidoctor-diagram \
           -a icons=font \
           -a experimental=true \
           -a source-highlighter=rouge \
           -a rouge-theme=github \
           -a rouge-linenums-mode=inline \
           -a docinfo=shared \
           -a imagesdir=images \
           -a toc=left \
           -a toclevels=2 \
           -a sectanchors=true \
           -a sectnums=true \
           -a favicon=themes/favicon.png \
           -a sourcedir=src/main/java \
           -b html5 \
           "${CURRENT_FOLDER}/${BUILD_DIR}/*.adoc"
rm -rf ./.asciidoctor
echo Creating html-docs in Docker finished ...

rm -rf -v $BUILD_DIR/*.adoc
rm -v $BUILD_DIR/docinfo.html

# https://github.com/asciidoctor/docker-asciidoctor

# source-highlighter [highlightjs,rouge,coderay,prettify, pygments]

# Rouge
# https://asciidoctor.org/docs/user-manual/#rouge
# rouge-style [base16,bw,colorful,github,gruvbox,igor_pro,magritte,molokai,monokai,monokai_sublime,pastie,thankful_eyes,tulip]
#           -a source-highlighter=rouge \
#           -a rouge-theme=gruvbox \
#           -a rouge-linenums-mode=inline \
#           -a docinfo=shared \


# Highlightjs
#           -a source-highlighter=highlightjs \
#           -a highlightjsdir=highlight \
#           -a highlightjs-theme=gruvbox-dark \

#Pygmrnts
# pygments ist derzeit nicht im docker-image enthalten, da im docker image nur python3 verfügbar ist
#           -a source-highlighter=pygments \
#           -a pygments-style=emacs \

# Creating a Dockerized Hugo + AsciiDoctor Toolchain
# https://rgielen.net/posts/2019/creating-a-dockerized-hugo-asciidoctor-toolchain/
# https://rgielen.net/posts/2019/creating-a-blog-with-hugo-and-asciidoctor/


