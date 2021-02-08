#!/bin/bash
OUTPUT=1  # define start variabile to while
if  test -f servers ; then #verify if file containers exist
req=`cat servers` #read from file servers numbers of containers how much is need
fi 
re='^[0-9]+$' #define a variabile re template of number
if ! [[ $req =~ $re ]] ; then #verify if $req is a number compare it whit template $re
req=6; #set $req to 6 if $req is not a number or is not difinet
fi
if [ "$req" -le  "6" ]&&[ "$req" -gt "0" ];then #verify if $req number of containers is betwen 1 and 6
	echo "Will be deployed $req servers" #echo numbers of containers will be deployed
else
	echo "Is wrong number of SERVERS" #echo the numbers is not betwen 1 and 6
	req="6"	#set $req numbers of containers to 6
fi

ports=(unused 8120 8121 8122 8123 8124 8125) #define ports will used by containers
names=(unused first_nginx second_nginx third_nginx fourth_nginx fifth_nginx sixth_nginx) #define names used by continers
bringe=`docker network ls | grep "bridge" | awk '{print $1}'` #define number of the generated bridge docker virtual netwok
echo "upstream devops {">ntmp #wipe and write first line of the temporary file
while [ $OUTPUT -le $req ] #begin loop
do
if docker ps -a | grep ${names[OUTPUT]}; then #verify if server is up
docker stop ${names[OUTPUT]} #stop server
fi
docker run -it --rm -d -p ${ports[OUTPUT]}:80 --cpus=1 -m 512m --memory-reservation=256m --name ${names[OUTPUT]} codi92/devopbuild_nginx #start container
echo "server localhost:${ports[OUTPUT]} weight=1;">>ntmp #write to temporary file a port userd by container
con="${names[OUTPUT]}" #define name of container
container_name=`docker ps |grep ${names[OUTPUT]}|awk '{system("echo "$NF" ")}'` #define name of container
container_hostname=`docker exec -i $con  cat /etc/hostname` #determine hostname of the container
container_ip=`docker network inspect -f '{{json .Containers}}' ${bringe} | jq '.[] |		.Name + ":" + .IPv4Address'| tr -d '"'| tr ':' ' '|awk -vpar=$container_name '{for(i=1;i<=NF;i++)if($i==par) print $(i+1)}'` #determine ip addres of the container
echo "<head><title>It is the app</title><style>.content {max-width: 500px;margin: auto;padding: 10px;}</style></head><body><div class="content"><h1> Hello World <br><h2> This is the $container_name container <br><h2> his hostname is : $container_hostname <br><h2> his ip is : $container_ip <br></div></body>">tmp #write temporari index.html file
docker cp tmp ${names[OUTPUT]}:/var/www/app.slajnev.tk/public/index.html #write index.html file to running continer filesistem
OUTPUT=$((OUTPUT+1)) #incriment start variabile
done
echo "}
">>ntmp #close temporari file to ngix configuration
sudo cp ./ntmp /etc/nginx/sites-enabled/ #write nginx configuration file
sudo service nginx restart #restarting nginx
rm tmp ntmp
