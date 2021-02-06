pipeline {
       agent any
        stages {
                stage('Start Biulding') {
                steps {
                sh '''
			docker ps | grep "first_nginx" |awk '{print $1}' |  xargs --no-run-if-empty docker stop
			docker ps | grep "second_nginx" |awk '{print $1}' |  xargs --no-run-if-empty docker stop
                '''
					}
				}
		stage('Remove images') {
                steps {
                sh '''
			echo "This Is test"
			docker images -aq | xargs --no-run-if-empty docker rmi -f
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
			docker run -it --rm -d -p 8090:80 --cpus=1 -m 512m --memory-reservation=256m --name first_nginx codi92/devopbuild_nginx
			docker run -it --rm -d -p 8100:80 --cpus=1 -m 512m --memory-reservation=256m --name second_nginx codi92/devopbuild_nginx
                '''
					}
				}
		stage('Config containers') {
                steps {
                sh '''
			for OUTPUT in `docker ps -aq`
			do
			container_name=`docker ps |grep $OUTPUT|awk '{system("echo "$NF" ")}'`
			container_hostname=`docker exec -i $OUTPUT  cat /etc/hostname`
			container_ip=`docker network inspect -f '{{json .Containers}}' a8e41f53a3de | jq '.[] | .Name + ":" + .IPv4Address'| tr -d '"'| tr ':' ' '|awk -vpar=$container_name '{for(i=1;i<=NF;i++)if($i==par) print $(i+1)}'`
			echo "<head><title>It is the app</title><style>.content {max-width: 500px;margin: auto;padding: 10px;}</style></head><body><div class="content"><h1> Hello World <br><h2> This is the $container_name container <br><h2> his hostname is : $container_hostname <br><h2> his ip is : $container_ip <br></div></body>">tmp
			docker cp tmp $OUTPUT:/var/www/app.slajnev.tk/public/index.html
			done
			'''
				}
			}				
        }
}

