version: "3.8"
services:
  nginx-proxy:
    build:
      context: ./nginx
      dockerfile: Dockerfile
      args:
        NGINX_VERSION: ${NGINX_VERSION}
    image: baokim/nginx:${NGINX_VERSION}
    container_name: nginx-proxy-${HOSTNAME}
    hostname: nginx-proxy
    restart: unless-stopped
    env_file: 
      - .env
    environment:
      - "TZ=Asia/Ho_Chi_Minh"
    volumes:
      - ./nginx/nginx.conf:/etc/nginx/nginx.conf:ro
      - ./nginx/conf.d/:/etc/nginx/conf.d/:ro
      - ./nginx/ssl/certs/:/etc/ssl/certs/:ro
    ports:
      - "80:8080"
      - "443:8443"
    networks:
      - prod_network
networks:
  prod_network:
    external: true
# End of file
