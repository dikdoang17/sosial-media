#!/bin/bash

apt-get update
apt-get install -y apache2 php php-mysql
apt-get install -y mysql-server

cd /etc/apache2/sites-available/ && sudo a2dissite 000-default

echo "
<VirtualHost *:80>
    DocumentRoot /var/www/html/sosial-media
    <Directory /var/www/html/>
        Options Indexes FollowSymLinks
        AllowOverride None
        Require all granted
    </Directory>
</VirtualHost>
" > sosial-media.conf

sudo a2ensite sosial-media && sudo service apache2 reload