This is a fork from https://github.com/DonMcNamara/dockerfiles/tree/master/dockerjekyllpages which is built at https://hub.docker.com/r/dmcnamara/dockerjekyllpages/

This repo is built at https://hub.docker.com/r/whitegecko/dockerjekyllpages/

### Description
This is a docker image to build a Jekyll page from a Git repository.
This is essentially githubpages in a docker image.
This docker image uses nginx, Jekyll, uwsgi and supervisor.

### Configuration of docker image
The git repository URL is passed as an environment variable to the docker image.
The environment variable is named `REPO`, also a branch to build can be specified using the variable `BRANCH`.
Alternatively the container can be linked to a volume at `/data/jekyll/source` which contains the Jekyll page to build.

### Triggering builds
To initiate a rebuild, you can use your browser to load http://yourserver/cgi/buildsite.sh

For an automatic build, you can set up a git service hook that posts to that URL on a git push.
Your site will rebuild when you push changes to your repository.

### Execution
Per default the site will be hosted on port 80.
This is especially useful in combination with a proxy container e.g. the one from [jwilder](https://hub.docker.com/r/jwilder/nginx-proxy/).

If you want to serve you site locally you can map it e.g. to port 8080:
```
sudo docker run -p 8080:80 -e REPO=[YOUR REPO URL HERE] -e BRANCH=[YOUR BRANCH] white-gecko/dockerjekyllpages
```

### Release Notes

#### 0.2.0 Some Improvements
* Update base image, ruby and thus jekyll
* Reorganize file structure
* NGINX: also serve pages without .html
* NGINX: deliver 404 status codes
* NGINX: serve custom 404 pages
* Build process: install dependencies from Gemfile
* Build process: specify branch to checkout
* Build process: build from volume
* Update README

#### 0.1.0 Initial release.
* It seems to work.
