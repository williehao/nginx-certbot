FROM ubuntu:20.04
ENV container docker
ENV PATH /snap/bin:$PATH
ADD snap /usr/local/bin/snap
MAINTAINER Willie Cheng  (williehao@gmail.com)

# install nginx
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y nginx iputils-ping net-tools cron vim

# install certbot 
RUN apt-get update -y
RUN apt-get install certbot -y
RUN apt-get update -y

# deamon mode off
RUN mkdir -p /var/www/certbot
RUN chmod 755 -R /var/www/certbot/
COPY nginx.sh /etc/nginx/nginx.sh
RUN chmod 755 -R /etc/nginx/nginx.sh

# give execution right on the cron job
#COPY cronjob /etc/cron.d/cronjob
#RUN chmod 0644 /etc/cron.d/cronjob && crontab /etc/cron.d/cronjob
# apply cron job
#RUN crontab /etc/cron.d/cronjob
#RUN touch /var/log/cron.log

# expose ports
EXPOSE 80

# work dir
WORKDIR /etc/nginx

# make certs dir as volume
VOLUME ["/etc/letsencrypt"]

#Dockerfile Command to start the cron and your own script and keep the container running
CMD ["/bin/bash" ,"-c" ,"service cron start && bash nginx.sh && tail -f /dev/null"]

