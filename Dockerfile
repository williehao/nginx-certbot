FROM ubuntu:20.04
ENV container docker
ENV PATH /snap/bin:$PATH
ADD snap /usr/local/bin/snap
MAINTAINER Willie Cheng  (williehao@gmail.com)

# install nginx
#RUN apt update -y
#RUN apt upgrade -y
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y nginx iputils-ping net-tools cron

# install certbot 
RUN apt-get update -y
RUN apt-get install certbot -y
RUN apt-get update -y

# deamon mode off
#RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
#RUN chown -R nobody:nogroup /var/lib/nginx
#RUN chmod 755 -R  /var/lib/nginx
RUN mkdir -p /var/www/certbot
RUN chmod 755 -R /var/www/certbot/
COPY nginx.sh /etc/nginx/nginx.sh
RUN chmod 755 -R /etc/nginx/nginx.sh

# setup cron
COPY cronjob /etc/cron.d/cronjob
RUN chmod 0644 /etc/cron.d/cronjob && crontab /etc/cron.d/cronjob

# expose ports
EXPOSE 80

# work dir
WORKDIR /etc/nginx

# add entrypoing
#ADD docker-entrypoint.sh .

# make certs dir as volume
VOLUME ["/etc/letsencrypt"]

CMD ["/etc/nginx/docker-entrypoint.sh"]
