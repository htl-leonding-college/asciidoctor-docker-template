#!/bin/bash
# DO NOT USE
# OR RATHER READ IT AND THEN USE
# ONLY WORKS FROM THE PROJECT DIR
# WILL PUBLISH STUFF ON THE WEBSITE, DON'T SCREW UP
BUILD_DIR="gh-pages"
OLD=$(PWD)
ORIGIN_URL=$(git config --get remote.origin.url)
${PWD}/build-html-docker.sh
cd $BUILD_DIR
git init
git add .
git commit -m "$USER - rebuilding gh-pages $(date)"
git remote add origin $ORIGIN_URL
git push --force origin master:gh-pages
cd $OLD
rm -rf $BUILD_DIR

# Sources:
# maybe better with subtrees -> https://gist.github.com/cobyism/4730490
# https://blog.bloomca.me/2017/12/15/how-to-push-folder-to-github-pages.html
