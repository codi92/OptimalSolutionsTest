pipeline {
        agent any
        stages {
                stage('Start Biulding') {
                steps {
                sh '''
				docker ps -aq | xargs --no-run-if-empty docker stop
				docker ps -aq | xargs --no-run-if-empty docker rm
                '''
					}
				}
		stage('Remove images') {
                steps {
                sh '''
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
				docker push codi92/devopbuild_nginx
		'''
					}
				}
		stage('Run Containers') {
		steps {
                sh '''
				docker run -it --rm -d -p 8090:80 --cpus=1 -m 512m --memory-reservation=256m --name first_nginx devopbuild_nginx
				docker run -it --rm -d -p 8100:80 --cpus=1 -m 512m --memory-reservation=256m --name second_nginx devopbuild_nginx
                '''
					}
				}
		stage('Config containers') {
                steps {
                sh '''
				
				echo "<head><title>It is the app</title><style>.content {max-width: 500px;margin: auto;padding: 10px;}</style></head><body><div class="content">
				<h1> Hello World <br>"> first,second
				echo "<h2> This is the first container <br>">> first
				echo "<h2> his ip is :" `docker network inspect -f '{{json .Containers}}' a8e41f53a3de | jq '.[] | .Name + ":" + .IPv4Address' | grep "first"` "<br>">>first
				echo "<h2> his hostname is : "`docker exec first_nginx cat /etc/hostname` "<br>">>first,second
				echo "<h2> This is the second container <br>" >> second
				echo "<h2> his ip is :" `docker network inspect -f '{{json .Containers}}' a8e41f53a3de | jq '.[] | .Name + ":" + .IPv4Address' | grep "second"` "<br>">> second
				echo "</div></body>">>first,second
				docker cp first first_nginx:/var/www/app.slajnev.tk/public/index.html
				docker cp second second_nginx:/var/www/app.slajnev.tk/public/index.html
				'''
				}
			}				
        }
}

