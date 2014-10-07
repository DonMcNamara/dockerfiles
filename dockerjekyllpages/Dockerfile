FROM ubuntu:trusty
MAINTAINER dmcnamara

# Install
RUN apt-get update && apt-get install -y \
     git \
     ruby1.9.1-full \
     build-essential \
     nginx \
     uwsgi \
     uwsgi-core \
     supervisor \
     nodejs

RUN gem install --no-rdoc --no-ri jekyll

# Configure nginx.
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

# Add configuration files.
ADD ./nginx.conf /etc/nginx/sites-enabled/default
ADD ./uwsgi.ini /data/uwsgi/uwsgi.ini
ADD ./supervisor-app.conf /etc/supervisor/conf.d/

# Add the script used to kick off the jekyll build.
ADD ./buildsite.sh /data/cgi/buildsite.sh
RUN chmod +x /data/cgi/buildsite.sh

EXPOSE 80
CMD ["supervisord", "-n"]
