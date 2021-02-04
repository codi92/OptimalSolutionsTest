pipeline {
        agent any
        stages {
                stage('Start Biulding') {
                steps {
                sh '''
					echo "Stop containers"
					docker ps -aq | xargs --no-run-if-empty docker stop
					docker ps -aq | xargs --no-run-if-empty docker rm
                '''
					}
				}
				stage('Remove images') {
                steps {
                sh '''
					docker images -aq || xargs --no-run-if-empty docker rmi -f
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
				stage('Run Containers') {
                steps {
                sh '''
					docker run -it --rm -d -p 8090:80 --cpus=1 -m 512m --memory-reservation=256m --name first_nginx optimalsolutionstest_nginx
					docker run -it --rm -d -p 8100:80 --cpus=1 -m 512m --memory-reservation=256m --name second_nginx optimalsolutionstest_nginx
                '''
					}
				}
				stage('Config containers') {
                steps {
                sh '''
					echo "Hello World" > first
					echo "This is the first container " >> first
					echo "his ip is :" `docker network inspect -f '{{json .Containers}}' a8e41f53a3de | jq '.[] | .Name + ":" + .IPv4Address' | grep "first"` >>first
					echo "his hostname is : "`docker exec first_nginx cat /etc/hostname` >>first
					echo "Hello World" > second
					echo "This is the second container" >> second
					echo "his ip is :" `docker network inspect -f '{{json .Containers}}' a8e41f53a3de | jq '.[] | .Name + ":" + .IPv4Address' | grep "second"` >> second
					echo "his hostname is : "`docker exec second_nginx cat /etc/hostname` >>second
					echo "end setup"
					docker cp first first_nginx:/var/www/app.slajnev.tk/public/index.html
					docker cp second second_nginx:/var/www/app.slajnev.tk/public/index.html
				'''
					}
				}				
        }
}
