This is a fork from https://github.com/DonMcNamara/dockerfiles/tree/master/dockerjekyllpages which is built at https://hub.docker.com/r/dmcnamara/dockerjekyllpages/

This repo is built at https://hub.docker.com/r/whitegecko/dockerjekyllpages/

### Description
This is a docker image to run Jekyll against a git repository. This is essentially githubpages in a docker image. This docker image uses nginx, Jekyll, uwsgi and supervisor.

### Configuration of docker image
The git repository URL is passed as an environment variable to the docker image. The environment variable is named REPO.

### Triggering builds
To initiate a rebuild, you can use your browser to load http://yourserver/cgi/buildsite.sh

For an automatic build, you can set up a git service hook that posts to that URL on a git push. Your site will rebuild when you push changes to your repository.


### Execution
This will host your Jekyll built site on local port 8080.
```
sudo docker run -p :8080:80 -e REPO=[YOUR REPO URL HERE] dmcnamara/dockerjekyllpages
```

The repository URL is the URL to the .git file. For example, on github, it would be something like https://github.com/username/myrepo.git

### Release Notes

#### 0.1 Initial release.
* It seems to work.
