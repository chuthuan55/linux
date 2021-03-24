# install docker 
  sudo yum install -y yum-utils
  
  sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
  
  sudo yum install docker-ce docker-ce-cli containerd.io

  sudo systemctl start docker

# list all container
  docker ps

# create container
  docker run --name nginx -p 80:80 -dit nginx
  docker run --name myubuntu -dit ubuntu

  
# allow to come in container
  docker exec -it nginx bash
  ls -l

# stop container
  docker stop nginx

# remove container
  docker rmi nginx

# list all available docker images
  docker images

# create container
  docker run --name mynginx -v /tmp/nginx.conf:/etc/nginx/nginx.conf:ro nginx

# restart container
  docker restart mynginx

# su dung docker cau lenh y het, co the thay doi tu ben ngoai
  docker exec -it <container name> cat /etc/nginx/nginx.conf

# remove unuse data
  docker system prune

# search container detail
  docker logs --tail 10 -f container_name
  abc
  
# if use external (network)
   docker network create lemp_network

# 
  docker stats ~ htop