#!/bin/bash


yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "<html><body><h1>WEB TIER ACCESS"</h1></body></html>" /var/www/html/index.html