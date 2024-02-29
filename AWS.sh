#!/bin/bash

yum update -y 
yum install httpd -y
service httpd start 
if ! command -v chkconfig &> /dev/null
then
    yum install chkconfig -y
fi
chkconfig httpd on 
cd /var/www/html
echo "<html><h1>This is a website</html></h1>" > index.html 
aws s3 mb s3://thisismybucket
aws s3 cp index.html s3://thisismybucket
