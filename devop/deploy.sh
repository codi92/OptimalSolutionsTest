docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
#docker rmi -f $(docker images -q)
docker-compose -f first/docker-compose.yaml  build
docker-compose -f second/docker-compose.yaml  build
docker run -it --rm -d -p 8090:80 --cpus=1 -m 512m --memory-reservation=256m --name first_nginx first_nginx
docker run -it --rm -d -p 8100:80 --cpus=1 -m 512m --memory-reservation=256m --name second_nginx second_nginx

