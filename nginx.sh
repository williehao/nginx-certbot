#!/bin/bash
echo ">>>> Running"
# give execution right on the cron job
chmod 0644 /etc/cron.d/cronjob && crontab /etc/cron.d/cronjob

# apply cron job
crontab /etc/cron.d/cronjob
touch /var/log/cron.log

# start nginx with nginx.conf
nginx -c /etc/nginx/nginx.conf
nginx -s reload

declare -A arr
declare -A arr1

arr["std11.veretos.com"]="willie.wh.cheng@getac.com.tw"
#arr["std12.veretos.com"]="willie.wh.cheng@getac.com.tw"
#arr+=( ["key2"]=val2 ["key3"]=val3 )

## clone array for testing 
for key in "${!arr[@]}"; do
  arr1[$key]=${arr[$key]}
done


## for testing CA key
for key in ${!arr[@]}; do
    #echo ${key} ${arr[${key}]}
    certbot certonly --webroot --webroot-path /var/www/certbot/ --non-interactive --agree-tos --email '${arr[${key}]}' --dry-run  -d ${key}
done


## get a real CA key
echo "------------------------" 
for key in ${!arr1[@]}; do
    #echo ${key} ${arr1[${key}]}
    certbot certonly --webroot --webroot-path /var/www/certbot/ --non-interactive --agree-tos --email "${arr1[${key}]}"  -d ${key}
done


echo "<<< Ending"
