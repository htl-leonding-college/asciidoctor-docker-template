#!/bin/bash
# DO NOT USE
# OR RATHER READ IT AND THEN USE
# ONLY WORKS FROM THE PROJECT DIR
# WILL PUBLISH STUFF ON THE WEBSITE, DON'T SCREW UP
BUILD_DIR="gh-pages"
export old=${PWD}
${PWD}/build-html-docker.sh
cd $BUILD_DIR
git init
git add .
git commit -m "$USER - rebuilding gh-pages $(date)"
git remote add origin $(git config --get remote.origin.url)
git push --force origin master:gh-pages
cd $old
