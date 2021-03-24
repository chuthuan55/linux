# install nginx 
sudo apt update
sudo apt install nginx

# install MariaDB Database Server
sudo apt-get install mariadb-server mariadb-client

sudo mysql_secure_installation

sudo mysql -u root -p

# install php
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:ondrej/php

sudo apt update

sudo apt install php7.4-fpm php7.4-common php7.4-mysql php7.4-gmp php7.4-curl php7.4-intl php7.4-mbstring php7.4-xmlrpc php7.4-gd php7.4-xml php7.4-cli php7.4-zip

sudo nano /etc/php/7.4/fpm/php.ini
( # correct:
 file_uploads = On
allow_url_fopen = On
short_open_tag = On
memory_limit = 256M
cgi.fix_pathinfo = 0
upload_max_filesize = 100M
max_execution_time = 360
date.timezone = America/Chicago)

# Create WordPress Database
sudo mysql -u root -p

CREATE DATABASE wpdb;
CREATE USER 'wpdbuser'@'localhost' IDENTIFIED BY '1';
GRANT ALL ON wpdb.* TO 'wpdbuser'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EXIT;

# Download WordPress
cd /tmp
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
sudo mv wordpress /var/www/wordpress

sudo chown -R www-data:www-data /var/www/wordpress/
sudo chmod -R 755 /var/www/wordpress/

# Configure Nginx
sudo nano /etc/nginx/sites-available/wordpress

server {
    listen 80;
    listen [::]:80;
    root /var/www/wordpress;
    index  index.php index.html index.htm;
    server_name  example.com www.example.com;

    client_max_body_size 100M;
    autoindex off;
    location / {
        try_files $uri $uri/ /index.php?$args;
    }

    location ~ \.php$ {
         include snippets/fastcgi-php.conf;
         fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
         fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
         include fastcgi_params;
    }
}

sudo ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/

sudo nginx -t
sudo systemctl restart nginx.service