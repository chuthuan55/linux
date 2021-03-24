# install
  sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  docker-compose --version


# cd /root/webserver/
  # up to webserver
  docker-compose up -d
  # download
  docker-compose down -v

  # restart all services
  docker-compose restart

  # restart one service
    docker-compose restart <service name>

  # delete 1 service
    docker rm -f <service name>  