#!/bin/bash
# DO NOT USE
# OR RATHER READ IT AND THEN USE
# ONLY WORKS FROM THE PROJECT DIR
# WILL PUBLISH STUFF ON THE WEBSITE, DON'T SCREW UP
BUILD_DIR="gh-pages"
echo "BUILD_DIR->${BUILD_DIR}"
OLD=${PWD}
echo "OLD->${OLD}"
ORIGIN_URL=$(git config --get remote.origin.url)
echo "ORIGIN_URL->${ORIGIN_URL}"
echo "->${PWD}/build-html-docker-inside-docker.sh"
${PWD}/build-html-docker-inside-docker.sh
#echo "*******************************"
#ls -lah ${OLD}/${BUILD_DIR}
#echo "*******************************"
#exit 0
cd $BUILD_DIR
echo "GIT_GLOBAL_MAIL->${GIT_GLOBAL_MAIL}"
echo "GIT_GLOBAL_USER_NAME->${GIT_GLOBAL_USER_NAME}"
git config --global user.email ${GIT_GLOBAL_MAIL}
git config --global user.name ${GIT_GLOBAL_USER_NAME}
git init
git add .
git commit -m "$USER - rebuilding gh-pages $(date)"
git remote add origin $ORIGIN_URL


# echo gh-pages url
IFS='/' read -ra TEMP <<< "$ORIGIN_URL"
#for i in "${TEMP[@]}"; do
#    # process "$i"
#    echo "$i"
#done
REPO_NAME=${TEMP[4]}
echo
echo "***********************************************************"
echo trying to create gh-pages under following url
echo https://${TEMP[3]}.github.io/${REPO_NAME%.*}
echo "***********************************************************"


# Sources:
# https://stackoverflow.com/a/965072
# https://stackoverflow.com/a/918931
# maybe better with subtrees -> https://gist.github.com/cobyism/4730490
# https://blog.bloomca.me/2017/12/15/how-to-push-folder-to-github-pages.html
