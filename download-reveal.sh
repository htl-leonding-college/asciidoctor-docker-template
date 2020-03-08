set -e
REVEAL_VERSION="3.9.2"
curl -L https://github.com/hakimel/reveal.js/archive/$REVEAL_VERSION.zip --output revealjs.zip
unzip revealjs.zip
mv reveal.js-$REVEAL_VERSION ./asciidocs/revealjs
rm revealjs.zip