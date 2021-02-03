docker stop first_nginx second_nginx
docker rm -f first_nginx second_nginx
cd ./first/
ls
docker-compose  build
cd ../second/
ls
docker-compose  build
cd ../
docker run -it --rm -d -p 8090:80 --cpus=1 -m 512m --memory-reservation=256m --name first_nginx first_nginx
docker run -it --rm -d -p 8100:80 --cpus=1 -m 512m --memory-reservation=256m --name second_nginx second_nginx

