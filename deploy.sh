echo "start Build"
echo "Stop containers"
docker ps -aq | xargs --no-run-if-empty docker stop
docker ps -aq | xargs --no-run-if-empty docker rm
echo "Remove images"
docker images -aq || xargs --no-run-if-empty docker rmi -f
echo "Start build"
docker-compose build
echo "Run Containers"
docker run -it --rm -d -p 8090:80 --cpus=1 -m 512m --memory-reservation=256m --name first_nginx optimalsolutionstest_nginx
docker run -it --rm -d -p 8100:80 --cpus=1 -m 512m --memory-reservation=256m --name second_nginx optimalsolutionstest_nginx
echo "end setup"
docker cp first first_nginx:/var/www/app.slajnev.tk/public/index.html
docker cp second second_nginx:/var/www/app.slajnev.tk/public/index.html
echo "done"
exit 1
