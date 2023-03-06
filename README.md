# Not yet finishing 


# Nginx-Certbot-Docker
Automatically create and renew SSL certificates with Certbot and Nginx using the Let's Encrypt free certificate authority into the Docker environment. 

## Quick Start
```shell
## 1. Config your nginx.conf 
docker run -itd --name test  --network=host  -v "${PWD}"/nginx.conf:/etc/nginx/conf.d/nginx.conf -v "${PWD}"/nginx.sh:/etc/nginx/nginx.sh -v "${PWD}"/cronjob:/etc/cron.d/cronjob   williehao:nginx-cert:V20.04

## 2. Get a Key from 

```



## Usage
### Before you start with IPV6(or IPV4)
Please check your environment has already have:     
   1. Domain name EX: www.google.com
   2. IPV6 address 
   3. 80 Port (for Let's Encrypt chcking your Domain name )
   4. Docker 

#### How to check local environment
   1. Domain name is okay (EX: ping6 www.google.com)   
![image](https://user-images.githubusercontent.com/15116422/222399319-13ba7eac-3caa-45ed-b790-fd721e487379.png)
   2. IPV6 address is already (EX:ifconfig)
![image](https://user-images.githubusercontent.com/15116422/222400801-9485e9ab-2824-4790-aa92-d6cfbf9aa4b6.png)
   3. 80 port check (EX: telnet www.google.com 80)   
![image](https://user-images.githubusercontent.com/15116422/222610114-5e755013-946f-4cea-ba1e-d7ba30c69eb1.png)

### Running Nginx-Certbot-Docker
![image](https://user-images.githubusercontent.com/15116422/223012315-9b8c2ac3-299e-4d2a-b755-cfdeb9cbaf6e.png)
```shell
docker run -itd --name test  --network=host  -v "${PWD}"/nginx.conf:/etc/nginx/conf.d/nginx.conf -v "${PWD}"/nginx.sh:/etc/nginx/nginx.sh -v "${PWD}"/cronjob:/etc/cron.d/cronjob   williehao:nginx-cert:V20.04

```

#### How to check more messages
you can check log file from crontab.log or /var/log/letsencrypt/letsencrypt.log, it will be give you very more detail messages 

### You will get the CA key 
![image](https://user-images.githubusercontent.com/15116422/223026211-7ca19c6b-7a62-4559-9412-b835075b4db1.png)
```shell
### in the container
ls /etc/letsencrypt/live/***.***.com/
```

![image](https://user-images.githubusercontent.com/15116422/223027249-b51220ad-f2f0-417b-bdee-67d0d5935a32.png)
```shell
### in the Docker environment
ls live
```

PS: [Let’s Encrypt provides rate limits](https://letsencrypt.org/docs/rate-limits/)
