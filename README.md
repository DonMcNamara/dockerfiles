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

#### Use SSH Authentication
If you want to clone private git repositories your might want to forward your private SSH key resp. the *SSH Authentication Socket*.
Per default the `SSH_AUTH_SOCK` environment variable is set to `/var/run/ssh-agent.sock` in this image thus you only have to mount the hosts `SSH_AUTH_SOCK` to the container by adding the argument `-v "$SSH_AUTH_SOCK:/var/run/ssh-agent.sock"`.
If you don't have an `SSH_AUTH_SOCK` running on the docker host you can also mount the `id_rsa`-file e.g. with `-v $HOME/.ssh/id_rsa:/root/.ssh/id_rsa:ro`.
In the case that you are mounting a private key rather then using the hosts SSH agent it is a good idea to generate a key without password.

Usually you also want to tell the known hosts to the container so it doesn't prompt for the decision.
You can do this by mounting the hosts `known_hosts`-file with `-v $HOME/.ssh/known_hosts:/root/.ssh/known_hosts:ro`.

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

### Changelog

#### 0.3.1
* Remove apt list cache after installation with apt-get (should save some space)

#### 0.3.0 Add Support for private SSH repositories
* Set SSH_AUTH_SOCK environment variable per default
* README: Explain how to forward the respective SSH resources to the container

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
