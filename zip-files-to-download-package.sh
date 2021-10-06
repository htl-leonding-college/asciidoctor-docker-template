set -e
# delete file, if exists
[ -f docs-as-code.zip ] && echo "  deleting: docs-as-code.zip" && rm docs-as-code.zip
zip -r docs-as-code \
       .env.template \
       .gitignore \
       asciidocs \
       asciidocs.demo \
       build-html-docker-inside-docker.sh \
       publish-gh-pages-inside-docker.sh \
       README.txt \
       run-inside-docker.sh
