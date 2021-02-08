To add this sctip to JENKINSFILE
need to be encoded base64
```
base64 <filename> > <encodestingfile>
```
to add use
```
echo "encodedstring"|base64 -d|bash
```
stop_containers.sh # this script is used to stop containers from list of names

deploy_containers.sh # this script is used to deploy and configure 6 servers

# To limit numbers of servers create file "servers" whith numbers of servers amount you need from 1 to 6
example 
```
echo "1" >servers #to deploy 1 server
``` 
