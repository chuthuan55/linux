# install
sudo apt update
sudo apt install nginx


# check web server
sudo systemctl enable nginx
sudo systemctl disable nginx

sudo systemctl start nginx
sudo systemctl status nginx

# 
sudo mkdir -p /var/www/thuan.com/html
sudo chmod -R 755 /var/www/thuan.com
sudo nano /var/www/thuan.com/html/index.html
<html>
    <head>
        <title>Welcome to Thuan.com!</title>
    </head>
    <body>
        <h1>Success!  The thuan.com server block is working!</h1>
    </body>
</html>




sudo nano /etc/nginx/sites-available/thuan.com
server {
        listen 80;
        listen [::]:80;

        root /var/www/thuan.com/html;
        index index.html index.htm index.nginx-debian.html;

        server_name thuan.com www.thuan.com;

        location / {
                try_files $uri $uri/ =404;
        }
}

sudo ln -s /etc/nginx/sites-available/thuan.com /etc/nginx/sites-enabled/


sudo nginx -t

sudo systemctl restart nginx
sudo systemctl reload nginx

# uninstall nginx
sudo apt remove nginx


# install nginx
  docker run --name nginx -p 80:80 -dit nginx


