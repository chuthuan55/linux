#Disable SELINUX
  sed -i "s/^SELINUX=.*/SELINUX=disabled/g" /etc/selinux/config
  setenforce 0

#Install EPEL repo
  yum install -y epel-release
  yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm

#Install NGINX and PHP7.4
yum install epel-release yum-utils
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum-config-manager --enable remi-php74
yum install -y nginx
yum -y install php-fpm php-mysqlnd

#Restart httpd and php-fpm
systemctl start php-fpm
systemctl enable php-fpm
systemctl start nginx
systemctl enable nginx

#Config nginx: nano /etc/nginx/conf.d/abc.conf

cat << 'EOF' >  /etc/nginx/conf.d/abc.conf
server {
    listen       9080;
    server_name  wordpress.xyz;

    access_log  /var/log/nginx/wordpress.xyz.access.log  combined;
    error_log   /var/log/nginx/wordpress.xyz.error.log debug;

    root   /var/www/wordpress/;
    index index.php index.html index.htm;
    
    sendfile off;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /var/www;
    }


    # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
    #
    location ~ \.php$ {
      try_files $uri $uri/ =404;
	    fastcgi_split_path_info ^(.+\.php)(/.+)$;
	    fastcgi_pass   127.0.0.1:9000;
	    fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
      fastcgi_param SCRIPT_NAME $fastcgi_script_name;
      fastcgi_index index.php;
	    include fastcgi_params;
      fastcgi_read_timeout 120s;
        # fastcgi_param PHP_VALUE "memory_limit = 256M;";
	}

    location ~* \.(jpg|jpeg|gif|png|css|js|ico|webp|tiff|ttf|svg)$ {
    expires           5d;
    }

	  location ~ /\. {
       log_not_found off;
       deny all;
	  }

    location ^~ /.well-known {
        allow all;
        auth_basic off;
    }
}
EOF

# nano /var/www/html/info.php
mkdir -p /var/www/html/
cat << 'EOF' > /var/www/html/info.php
<?php

// Show all information, defaults to INFO_ALL
phpinfo();

// Show just the module information.
// phpinfo(8) yields identical results.
phpinfo(INFO_MODULES);

?>
EOF

#firewall
firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --reload
firewall-cmd --add-port=9080/tcp --permanent
firewall-cmd --reload

#Install Wordpress
cd /tmp
yum install -y wget
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
mkdir -p /var/www/wordpress/
sudo mv /tmp/wordpress/* /var/www/wordpress/
sudo chown -R nginx: /var/www/wordpress

systemctl restart nginx
systemctl restart php-fpm


#Install mariadb
sudo yum -y install mariadb-server

sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo systemctl status mariadb

sudo mysql_secure_installation

mysql -u root -p
CREATE DATABASE wordpress CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
GRANT ALL ON wordpress.* TO 'wordpressuser'@'localhost' IDENTIFIED BY '1';
FLUSH PRIVILEGES;
EXIT;

firewall-cmd --add-port=3306/tcp --permanent
firewall-cmd --reload