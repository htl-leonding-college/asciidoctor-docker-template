# asciidoctor-docker-template

## Overview

This is a template-project for

* generating AsciiDoc-Files to html-files and
* deploying the html-files to gh-pages,
* where the gh-pages are located in an branch of the repo.

AsciiDoctor - the software for converting the .adoc-files to .html-files - is executed in a Docker container.
So you have nothing to install on your local machine, except Docker

Two scripts are available:

* build-html-docker.sh -> builds the .html-pages in the folder gh-pages
* publish-gh-pages.sh -> builds and deploys the gh-pages

## Clear Commit History

After using this template for creating a new repo you may want to remove 
the existing commit-history to get a clean start of your project:

```
-- Remove the history from 
rm -rf .git

-- recreate the repos from the current content only
git init
git add .
git commit -m "Initial commit"

-- push to the github remote repos ensuring you overwrite history
git remote add origin git@github.com:<YOUR ACCOUNT>/<YOUR REPOS>.git
git push -u --force origin master
``` 

source: https://gist.github.com/stephenhardy/5470814