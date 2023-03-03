# Nginx-Certbot-Docker
Automatically create and renew SSL certificates with Certbot and Nginx using the Let's Encrypt free certificate authority into the Docker environment. 

## Quick Start

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

