1. Preparations

1.1 Create a .env - file

mv .env.template .env

1.2 fill out your github-email and github-username

GIT_GLOBAL_MAIL=<your email>
GIT_GLOBAL_USER_NAME=<your git - username>

1.3 make sure the docker daemon is started



2. Make an initial commit of your repo into the master branch



3. Start the generations of the gh-pages

NOTE: you must not change the settings of your gh-repo for adding the gh-pages

./run-inside-docker.sh

IMPORTANT: if an error occurs (error: src refspec master does not match any) run the script once more

TIP: you don't need the asciidocs.demo - folder. You are free to delete it.