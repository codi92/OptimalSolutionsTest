pipeline {
       agent any
        stages {
                stage('Start Biulding') {
                steps {
                sh '''
			#!/bin/bash
			OUTPUT=0
			req="5"
			names=(first_nginx second_nginx third_nginx fourth_nginx fifth_nginx sixth_nginx)
			while [ $OUTPUT -le $req ]
			do
				if [`docker ps -a | grep ${names[OUTPUT]}` ]; then
   			docker stop ${names[OUTPUT]}
			fi
			done

                '''
					}
				}
		stage('Remove images') {
                steps {
                sh '''
			echo "This Is test"
			#docker images -aq | xargs --no-run-if-empty docker rmi -f
                '''
					}
				}
		stage('Start build') {
                steps {
                sh '''
			docker-compose build
                '''
					}
				}
		stage('Upload to DockerHub'){
		steps {
		sh '''
			docker tag devopbuild_nginx:latest codi92/devopbuild_nginx
			docker image rm devopbuild_nginx
                        docker push codi92/devopbuild_nginx
		'''
					}
				}
		stage('Run Containers') {
		steps {
                sh '''
			#docker run -it --rm -d -p 8090:80 --cpus=1 -m 512m --memory-reservation=256m --name first_nginx codi92/devopbuild_nginx
			
			
			
                '''
					}
				}
		stage('Config containers') {
                steps {
                sh '''
		#!/bin/bash
OUTPUT=0
req="5"
ports=(8120 8121 8122 8123 8124 8125)
names=(first_nginx second_nginx third_nginx fourth_nginx fifth_nginx sixth_nginx)
bringe=`docker network ls | grep "bridge" | awk '{print $1}'`
echo "upstream devops {">ntmp
while [ $OUTPUT -le $req ]
do
if docker ps -a | grep ${names[OUTPUT]}; then
        docker stop ${names[OUTPUT]}
fi
        docker run -it --rm -d -p ${ports[OUTPUT]}:80 --cpus=1 -m 512m --memory-reservation=256m --name ${names[OUTPUT]} codi92/devopbuild_nginx
        echo "server localhost:${ports[OUTPUT]} weight=1;">>ntmp
		con="${names[OUTPUT]}"
		container_name=`docker ps |grep ${names[OUTPUT]}|awk '{system("echo "$NF" ")}'`
		container_hostname=`docker exec -it $con  cat /etc/hostname`
		container_ip=`docker network inspect -f '{{json .Containers}}' ${bringe} | jq '.[] |		.Name + ":" + .IPv4Address'| tr -d '"'| tr ':' ' '|awk -vpar=$container_name '{for(i=1;i<=NF;i++)if($i==par) print $(i+1)}'`
		echo "<head><title>It is the app</title><style>.content {max-width: 500px;margin: auto;padding: 10px;}</style></head><body><div class="content"><h1> Hello World <br><h2> This is the $container_name container <br><h2> his hostname is : $container_hostname <br><h2> his ip is : $container_ip <br></div></body>">tmp
		docker cp tmp ${names[OUTPUT]}:/var/www/app.slajnev.tk/public/index.html
		OUTPUT=$((OUTPUT+1))
done
echo "}
">>ntmp
sudo cp ./ntmp /etc/nginx/sites-enabled/
sudo service nginx restart
'''
				}
			}				
        }
}

