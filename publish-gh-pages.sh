#!/bin/bash
# DO NOT USE
# OR RATHER READ IT AND THEN USE
# ONLY WORKS FROM THE PROJECT DIR
# WILL PUBLISH STUFF ON THE WEBSITE, DON'T SCREW UP
export old=${PWD}
${PWD}/build-html-docker.sh
cd docs
git add .
git commit -m "update Demo Website"
git push origin master
cd $old

