#!/bin/bash
# Update OS
sudo yum update -y

# Increase system limit for number of concurrent TCP connections
echo -e"* soft nofile 32768\n* hard nofile 32768" |sudo  tee --append /etc/security/limits.conf>/dev/null

# Install EPEL
sudo yum install epel-release -y

# Install Nano
sudo dnf install nano -y

# Install PostgreSQL and PostGIS packages
sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm

# Update
sudo dnf update -y

# Enable PowerTools
sudo dnf config-manager --set-enabled powertools

# Disable system default PostgreSQL
sudo dnf -qy module disable postgresql

echo "If prompted, press y and then enter to import the GPG key"

# Install PostgreSQL 15
sudo dnf install -y postgresql15-server

# Install Java 11
sudo yum install java-11-openjdk-devel -y

# Install Python and PIP
sudo dnf install python39 -y

sudo dnf install python39-pip

# Upgrade PIP
sudo pip3 install --upgrade pip

wait

# Install GDown

pip install gdown

# Begin Google Drive TAK Server download

gdown [REMOVE BRACKETS AND PASTE YOUR G-DRIVE FILE ID HERE] 

# Begin install of TAK Server
cd
sudo yum install takserver-4.8-RELEASE31.noarch.rpm -y

# Policy install

sudo yum install checkpolicy
cd /opt/tak
sudo ./apply-selinux.sh
sudo semodule -l | grep takserver

# Database install

sudo /opt/tak/db-utils/takserver-setup-db.sh
sudo systemctl daemon-reload

# Move cert-metadata.sh file to /opt/tak/certs
# Replace your filename and uncomment the next two lines if you've saved your own cert-metadat.sh file.

# cd

# sudo mv -f ./[YOUR REPO NAME]/cert-metadata.sh /opt/tak/certs/cert-metadata.sh

# Start TAK Server Service

sudo systemctl start takserver

# Enable TAK Server auto-start

sudo systemctl enable takserver

# Install Firewalld

sudo yum install firewalld
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo systemctl status firewalld

# Configure Firewalld

sudo firewall-cmd --zone=public --add-port 8080/tcp --permanent
sudo firewall-cmd --zone=public --add-port 8088/tcp --permanent
sudo firewall-cmd --zone=public --add-port 8089/tcp --permanent
sudo firewall-cmd --zone=public --add-port 8443/tcp --permanent
sudo firewall-cmd --zone=public --add-port 8444/tcp --permanent
sudo firewall-cmd --zone=public --add-port 8446/tcp --permanent
sudo firewall-cmd --zone=public --add-port 9000/tcp --permanent
sudo firewall-cmd --zone=public --add-port 9001/tcp --permanent
sudo firewall-cmd --reload

echo "********** INSTALLATION COMPLETE! **********"
echo ""
echo "**** CHECK NOBODY IS OVER YOUR SHOULDER ****"
echo "**** IF YOU POSTED YOUR CREDS HERE FOR FAST-COPYING ****"
echo ""
echo "Access your TAK server via web browser"
echo ""
echo "http://[YOUR PUBLIC IP]:8080/setup for initial setup"
echo "|"
echo "http://[YOUR PUBLIC IP]:8446 unsecure connection"
echo "|"
echo " ---> requires admin account creation"
echo ""
echo "http://[YOUR PUBLIC IP]:8443 secure connection"
echo "|"
echo " ---> requires certificate creation"
echo "|"
echo "CREDS for copy/paste."
echo "Edit the line below (then remove this one) if you want to quickly run the 8080 setup."
echo "|"
echo "sudo java -jar /opt/tak/utils/UserManager.jar usermod -A -p [YOUR ADMIN PASSWORD] [YOUR ADMIN USERNAME]"
echo "|"
echo "sudo systemctl restart takserver"
