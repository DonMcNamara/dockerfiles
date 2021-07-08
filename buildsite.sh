#!/bin/bash

SOURCE="/data/jekyll/source"
TARGET="/data/jekyll/_site"

# Output an HTML header so this works as a CGI script.
echo "Content-type: text/html"
echo ""

echo "<HTML><BODY><PRE>"

if [ -z "$(ls -A $SOURCE)" ]
then
    # $SOURCE is empty
    if [ -z "$REPO" ]
    then
        echo "The source directory is empty and no repository is specified. I don't know what to build. :-("
        exit 1
    else
        # pull down the repo
        if [ -z "$BRANCH" ]
        then
            git clone $REPO $SOURCE
        else
            git clone --branch "$BRANCH" $REPO $SOURCE
        fi
    fi
else
    cd $SOURCE
    git pull || true
fi

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
