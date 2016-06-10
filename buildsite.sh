#!/bin/bash

# Output an HTML header so this works as a CGI script.
echo "Content-type: text/html"
echo ""

echo "<HTML><BODY><PRE>"

# delete the old directory. (This is a bit heavy handed.)
rm --recursive /data/jekyll/source

# pull down the repo
git clone $REPO /data/jekyll/source

# generate the site with jekyll
jekyll build -s /data/jekyll/source -d /data/jekyll/_site

echo
date

echo "</PRE></BODY></HTML>"
