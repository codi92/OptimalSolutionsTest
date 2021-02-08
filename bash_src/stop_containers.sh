names=(first_nginx second_nginx third_nginx fourth_nginx fifth_nginx sixth_nginx) #define names of the containers
OUTPUT=0 #define start variabile to loop
while [ $OUTPUT -le 5 ] #start loop
do
if docker ps -a | grep ${names[OUTPUT]} ; then #verify if container is running
echo "Stop container"
docker stop ${names[OUTPUT]} #stoping the container
fi
OUTPUT=$((OUTPUT+1)) #incriment the variabile
done
