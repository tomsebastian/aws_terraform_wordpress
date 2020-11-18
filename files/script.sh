#!/bin/bash
sudo echo "127.0.0.1 `hostname`" >> /etc/hosts
sudo apt-get update -y
sudo apt-get install mysql-client -y
sudo apt-get install apache2 apache2-utils -y
sudo apt-get install php7.4 -y
sudo apt-get install libapache2-mod-php7.4 php7.4-mcrypt php7.4-curl php7.4-gd php7.4-xmlrp -y
sudo apt-get install php7.4-mysqlnd-ms -y
sudo apt-get install php7.4-mysql -y
sudo service apache2 restart
sudo wget -c http://wordpress.org/wordpress-5.5.1.tar.gz
sudo tar -xzvf wordpress-5.5.1.tar.gz
sleep 20
sudo mkdir -p /var/www/html/
sudo rsync -av wordpress/* /var/www/html/
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/
sudo cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sudo service apache2 restart
sleep 20
