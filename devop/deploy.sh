docker stop devop_nginx
docker rmi -f devop_nginx nginx
docker-compose build
docker run -it --rm -d -p 80:80 --cpus=1 -m 512m --memory-reservation=256m --name devop_nginx devop_nginx

