
docker stop first_nginx
docker stop second_nginx
docker rmi -f first_nginx second_nginx
cd ./first/
docker-compose build
cd ../second/
docker-compose build
docker run -it --rm -d -p 8090:80 --cpus=1 -m 512m --memory-reservation=256m --name first_nginx first_nginx
docker run -it --rm -d -p 8100:80 --cpus=1 -m 512m --memory-reservation=256m --name second_nginx second_nginx
cd ../

