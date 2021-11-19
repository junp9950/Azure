#!/bin/bash
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
yum install -y httpd
echo "JIWOONG-AZURE-1" > /var/www/html/index.html
systemctl start httpd
systemctl enable httpd