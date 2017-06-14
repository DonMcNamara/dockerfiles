#!/bin/bash

SOURCE="/data/jekyll/source"
TARGET="/data/jekyll/_site"

# Output an HTML header so this works as a CGI script.
echo "Content-type: text/html"
echo ""

echo "<HTML><BODY><PRE>"

# delete the old directory. (This is a bit heavy handed.)
rm --recursive $SOURCE

# pull down the repo
git clone $REPO $SOURCE

if [ -s $SOURCE/Gemfile ]
then
    cd $SOURCE

    echo "Install dependencies from Gemfile"
    # update gems
    bundle install

    # generate the site with jekyll
    bundle exec jekyll build -s $SOURCE -d $TARGET
else
    echo "No Gemfile found use standard jekyll installation"
    # generate the site with jekyll
    jekyll build -s $SOURCE -d $TARGET
fi

echo
date

echo "</PRE></BODY></HTML>"
