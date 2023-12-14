# Nginx-Certbot-Docker (Automation Multiple Create or Renew SSL)
Automatically create and renew SSL certificates with Certbot and Nginx using the Let's Encrypt free certificate authority into the Docker environment. 
## Diagram

[![your-UML-diagram-name11](http://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.githubusercontent.com/williehao/nginx-certbot/main/nginx-certbot.iuml)](https://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.githubusercontent.com/williehao/nginx-certbot/main/nginx-certbot.iuml)



## Example for combining CA key with Nginx-SSL key
[How to use CA key with NGINX for SSL(HTTPS)](https://github.com/williehao/AntMediaServer-Nginx/edit/main/README.md)

## Quick Start
```shell
## Step:1. Config your nginx.conf with your Email and Domain name and then Running 'docker run"
docker run -itd --name test  --network=host  \
-v "${PWD}"/nginx.conf:/etc/nginx/conf.d/nginx.conf \
-v "${PWD}"/nginx.sh:/etc/nginx/nginx.sh -v "${PWD}"/cronjob:/etc/cron.d/cronjob \
-v "${PWD}"/:/etc/letsencrypt/ \
williehao/nginx-cert:V20.04

## Step:2. Get a CA Key from your host's direction
ls *** (your domain name)

## if you didn't see CA key please use "find" command line to find CA key location
sudo find / -name fullchain.pem 

## Step3: Combine CA key to another container(APP) which wants to use CA Key: (For example: Ant-Media-Server)
Docker run  -v "${PWD}"/:/etc/letsencrypt/  *** 
```


## Usage
### Before you start with IPV6(or IPV4)
Please check your environment has already had:     
   1. Domain name EX: www.google.com
   2. IPV6 address 
   3. 80 Port (for Let's Encrypt checking your Domain name )
   4. Docker 

#### How to check the local environment
   1. A Domain name is okay (EX: ping6 www.google.com)   
![image](https://user-images.githubusercontent.com/15116422/222399319-13ba7eac-3caa-45ed-b790-fd721e487379.png)
   2. An IPV6 address is already (EX:ifconfig)
![image](https://user-images.githubusercontent.com/15116422/222400801-9485e9ab-2824-4790-aa92-d6cfbf9aa4b6.png)
   3. 80 port check (EX: telnet www.google.com 80)   
![image](https://user-images.githubusercontent.com/15116422/222610114-5e755013-946f-4cea-ba1e-d7ba30c69eb1.png)

### Running Nginx-Certbot-Docker
![image](https://user-images.githubusercontent.com/15116422/223012315-9b8c2ac3-299e-4d2a-b755-cfdeb9cbaf6e.png)
```shell
docker run -itd --name test  --network=host  \
-v "${PWD}"/nginx.conf:/etc/nginx/conf.d/nginx.conf \
-v "${PWD}"/nginx.sh:/etc/nginx/nginx.sh -v "${PWD}"/cronjob:/etc/cron.d/cronjob \
-v "${PWD}"/:/etc/letsencrypt/ \
williehao/nginx-cert:V20.04

PS: don't use "--rm" if you want to auto-update CA key
```

#### How to check more messages
you can check log file from crontab.log or /var/log/letsencrypt/letsencrypt.log, which will give you very more detailed messages 

### You will get the CA key 
![image](https://user-images.githubusercontent.com/15116422/223049908-d384feb5-49dc-43f4-a602-c094a87c72d8.png)
```shell
### in the container
ls /etc/letsencrypt/live/***.***.com/
```

![image](https://user-images.githubusercontent.com/15116422/223027249-b51220ad-f2f0-417b-bdee-67d0d5935a32.png)
```shell
### in the Docker environment
ls live
```

---

## Troubleshooting   
1.Q: too many certificates (5) already issued for this exact set of domains in the last 168 hours    
A: waiting for the time because this rate limit is exceeded when a subscriber requests a certificate for the same “exact set” of hostnames more than 5 times in a single week    
[Reference](  https://letsencrypt.org/docs/duplicate-certificate-limit/)    

2.Q: too many failed authorizations recently    
  A: Change Email address    
![image](https://user-images.githubusercontent.com/15116422/223331098-0f3e4ec3-0421-4d38-96d1-8c52e00dd1e6.png)    



PS: [Let’s Encrypt provides rate limits](https://letsencrypt.org/docs/rate-limits/)     
