FROM ubuntu:20.04
ENV container docker
ENV PATH /snap/bin:$PATH
ADD snap /usr/local/bin/snap
MAINTAINER Willie Cheng  (williehao@gmail.com)

# install nginx
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y nginx iputils-ping net-tools

# install certbot 
RUN apt-get update -y
RUN apt-get install certbot -y
RUN apt-get update -y


# environment setup
RUN mkdir -p /var/www/certbot
RUN chmod 755 -R /var/www/certbot/
COPY nginx.sh /etc/nginx/nginx.sh
RUN chmod 755 -R /etc/nginx/nginx.sh

# expose ports
EXPOSE 80

# work dir
WORKDIR /etc/nginx

# add entrypoing
#ADD docker-entrypoint.sh .

# make certs dir as volume
VOLUME ["/etc/letsencrypt"]

CMD ["/etc/nginx/docker-entrypoint.sh"]
