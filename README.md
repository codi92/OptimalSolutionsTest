# OptimalSolutionsTest
## This is my Test task for optimalsolutionshub.net

### To Automatic deploy docker use command 
```
wget "https://raw.githubusercontent.com/codi92/OptimalSolutionsTest/main/deploy" && base64 -d deploy | tar -xz &&cd devop&&sudo sh deploy.sh&&cd ../
```
On this repo is stored my deploy and server configuration.
Tasks ended:

* Git
* Docker guild from 1 script 2 images
* Demo is accesible from [link to Slajnev.tk!](http://slajnev.tk/)
* Demo is work over CloudFlare network
* Domain is registred 2.2.2021
* Local nginx is configured proxy to :
	*  jenkins http://jenkins.slajnev.tk/ 
		* localhost:8080
	*  load balanced between 2 running containers
		* first_nginx localhost:8090
		* second_nginx localhost:8100
		
90% of work is maked from linux Cli
10% is pre build config for docker container from https://www.digitalocean.com/

Demo is running on VM on my home laptop

	* Ubuntu server 20.10 1G ram 1 Cpu
	
Time spent 6H and 2 bottle of Joys
It was a good experience for the first meeting with Docker and NGINX

