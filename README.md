# OptimalSolutionsTest
This is my Test task for optimalsolutionshub.net
To Automatic deploy docker use command 
wget "https://raw.githubusercontent.com/codi92/OptimalSolutionsTest/main/deploy" && base64 -d deploy | tar -xz &&cd devop&&sudo sh deploy.sh&&cd ../

On this repo is stored my deploy and server configuration.
Tasks ended:
1 Git
2 Docker guild from 1 script 2 images
3 Demo is accesible from http://slajnev.tk/
4 Demo is work over CloudFlare network
5 Domain is registred 2.2.2021
6 Local nginx is configured proxy to :
				1 jenkins http://jenkins.slajnev.tk/ 
					localhost:8080
				2 load balanced between 2 running containers
					first_nginx localhost:8090
					second_nginx localhost:8100
90% of work is maked from linux Cli
10% is pre build config for docker container from https://www.digitalocean.com/
						   https://www.digitalocean.com/community/tools/nginx?domains.0.server.domain=slajnev.tk&domains.0.https.https=false&domains.0.php.php=false&domains.0.routing.index=index.html&domains.0.routing.fallbackPhp=false&domains.0.logging.accessLog=true&domains.0.logging.errorLog=true&domains.0.restrict.postMethod=true&domains.0.restrict.putMethod=true&domains.0.restrict.patchMethod=true&domains.0.restrict.deleteMethod=true&domains.0.restrict.optionsMethod=true&domains.0.restrict.traceMethod=true&global.https.ocspCloudflare=false&global.logging.logNotFound=true&global.nginx.workerProcesses=1&global.nginx.user=nginx&global.nginx.pid=%2Fvar%2Frun%2Fnginx.pid&global.docker.dockerfile=true&global.docker.dockerCompose=true

Time spent 6H and 2 bottle of Joys
It was a good experience for the first meeting with Docker and NGINX

