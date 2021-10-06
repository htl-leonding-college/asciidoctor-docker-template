set -e
BUILD_DIR="gh-pages"
echo "BUILD_DIR->${BUILD_DIR}"
OLD=${PWD}
echo "OLD->${OLD}"
docker run --rm \
           -v ${PWD}:/documents \
           --env-file ./.env \
           asciidoctor/docker-asciidoctor:1.2.0  /bin/bash -c "/documents/publish-gh-pages-inside-docker.sh"
           #asciidoctor/docker-asciidoctor:1.2.0  /bin/bash -c "/documents/build-html-docker-inside-docker.sh"
cd $PWD/$BUILD_DIR
CURRENT_FOLDER=${PWD}
echo "current folder->${CURRENT_FOLDER}"
git push --force origin main:gh-pages
echo gh-pages pushed to github ...
cd $OLD
rm -rf $BUILD_DIR


# docker run --rm -it -v ${PWD}/$BUILD_DIR:/documents asciidoctor/docker-asciidoctor  /bin/bash