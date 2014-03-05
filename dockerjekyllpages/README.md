### Description
This is a docker image to run Jekyll against a git repository. This is essentially githubpages in a docker image. This docker image uses nginx, jekyll, uwsgi and supervisor.

### Configuation
The git repository URL is passed as an environment variable to the docker image. The environment variable is named REPO.

To initiate a rebuild, you can use your browser to load http://yourserver/cgi/buildsite.sh . You can set this up as a git service hook and your site will rebuild when you push changes to your repository.


### Execution
This will host your jekyll built site on local port 8080
```
sudo docker run -p 127.0.0.1:8080:80 -e REPO=[YOUR REPO URL HERE] dmcnamara/dockerjekyllpages
````

### Release Notes

#### 0.1 Initial release.
* It seems to work.
