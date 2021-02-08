pipeline {
  agent any
   stages {
                stage('Stoping containers before Biulding') {
                steps {	sh '''
#!/bin/bash
echo "bmFtZXM9KGZpcnN0X25naW54IHNlY29uZF9uZ2lueCB0aGlyZF9uZ2lueCBmb3VydGhfbmdpbnggZmlmdGhfbmdpbnggc2l4dGhfbmdpbngpCk9VVFBVVD0wCndoaWxlIFsgJE9VVFBVVCAtbGUgNSBdCmRvCmlmIGRvY2tlciBwcyAtYSB8IGdyZXAgJHtuYW1lc1tPVVRQVVRdfSA7IHRoZW4KZWNobyAiU3RvcCBjb250YWluZXIiCmRvY2tlciBzdG9wICR7bmFtZXNbT1VUUFVUXX0KZmkKT1VUUFVUPSQoKE9VVFBVVCsxKSkKZG9uZQo="|base64 -d|bash
'''}}
		stage('Remove images') {
		steps {sh '''
docker images -aq | grep codi92/devopbuild_nginx | xargs --no-run-if-empty docker rmi -f codi92/devopbuild_nginx
'''}}

	   
	   
}}
