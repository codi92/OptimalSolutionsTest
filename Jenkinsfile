pipeline {
  agent any
   stages {
                stage('Stoping containers before Biulding') { steps {	sh '''
#!/bin/bash
echo "bmFtZXM9KGZpcnN0X25naW54IHNlY29uZF9uZ2lueCB0aGlyZF9uZ2lueCBmb3VydGhfbmdpbnggZmlmdGhfbmdpbnggc2l4dGhfbmdpbngpCk9VVFBVVD0wCndoaWxlIFsgJE9VVFBVVCAtbGUgNSBdCmRvCmlmIGRvY2tlciBwcyAtYSB8IGdyZXAgJHtuYW1lc1tPVVRQVVRdfSA7IHRoZW4KZWNobyAiU3RvcCBjb250YWluZXIiCmRvY2tlciBzdG9wICR7bmFtZXNbT1VUUFVUXX0KZmkKT1VUUFVUPSQoKE9VVFBVVCsxKSkKZG9uZQo="|base64 -d|bash
'''}}
		stage('Remove images') { steps { sh '''
docker rmi -f codi92/devopbuild_nginx
'''}}
		stage('Start build') { steps { sh '''
docker-compose build
'''}}
	   	stage('Start and configure containers') { steps { sh '''
		#How much servers is need?
echo "1" >servers
echo "IyEvYmluL2Jhc2gKT1VUUFVUPTEKaWYgIHRlc3QgLWYgc2VydmVycyA7IHRoZW4KcmVxPWBjYXQgc2VydmVyc2AKZmkKcmU9J15bMC05XSskJwppZiAhIFtbICRyZXEgPX4gJHJlIF1dIDsgdGhlbgpyZXE9NjsKZmkKaWYgWyAiJHJlcSIgLWxlICAiNiIgXSYmWyAiJHJlcSIgLWd0ICIwIiBdO3RoZW4KCWVjaG8gIldpbGwgYmUgZGVwbG95ZWQgJHJlcSBzZXJ2ZXJzIgplbHNlCgllY2hvICJJcyB3cm9uZyBudW1iZXIgb2YgU0VSVkVSUyIKCXJlcT0iNiIKZmkKCnBvcnRzPSh1bnVzZWQgODEyMCA4MTIxIDgxMjIgODEyMyA4MTI0IDgxMjUpCm5hbWVzPSh1bnVzZWQgZmlyc3Rfbmdpbnggc2Vjb25kX25naW54IHRoaXJkX25naW54IGZvdXJ0aF9uZ2lueCBmaWZ0aF9uZ2lueCBzaXh0aF9uZ2lueCkKYnJpbmdlPWBkb2NrZXIgbmV0d29yayBscyB8IGdyZXAgImJyaWRnZSIgfCBhd2sgJ3twcmludCAkMX0nYAplY2hvICJ1cHN0cmVhbSBkZXZvcHMgeyI+bnRtcAp3aGlsZSBbICRPVVRQVVQgLWxlICRyZXEgXQpkbwppZiBkb2NrZXIgcHMgLWEgfCBncmVwICR7bmFtZXNbT1VUUFVUXX07IHRoZW4KZG9ja2VyIHN0b3AgJHtuYW1lc1tPVVRQVVRdfQpmaQpkb2NrZXIgcnVuIC1pdCAtLXJtIC1kIC1wICR7cG9ydHNbT1VUUFVUXX06ODAgLS1jcHVzPTEgLW0gNTEybSAtLW1lbW9yeS1yZXNlcnZhdGlvbj0yNTZtIC0tbmFtZSAke25hbWVzW09VVFBVVF19IGNvZGk5Mi9kZXZvcGJ1aWxkX25naW54CmVjaG8gInNlcnZlciBsb2NhbGhvc3Q6JHtwb3J0c1tPVVRQVVRdfSB3ZWlnaHQ9MTsiPj5udG1wCmNvbj0iJHtuYW1lc1tPVVRQVVRdfSIKY29udGFpbmVyX25hbWU9YGRvY2tlciBwcyB8Z3JlcCAke25hbWVzW09VVFBVVF19fGF3ayAne3N5c3RlbSgiZWNobyAiJE5GIiAiKX0nYApjb250YWluZXJfaG9zdG5hbWU9YGRvY2tlciBleGVjIC1pICRjb24gIGNhdCAvZXRjL2hvc3RuYW1lYApjb250YWluZXJfaXA9YGRvY2tlciBuZXR3b3JrIGluc3BlY3QgLWYgJ3t7anNvbiAuQ29udGFpbmVyc319JyAke2JyaW5nZX0gfCBqcSAnLltdIHwJCS5OYW1lICsgIjoiICsgLklQdjRBZGRyZXNzJ3wgdHIgLWQgJyInfCB0ciAnOicgJyAnfGF3ayAtdnBhcj0kY29udGFpbmVyX25hbWUgJ3tmb3IoaT0xO2k8PU5GO2krKylpZigkaT09cGFyKSBwcmludCAkKGkrMSl9J2AKZWNobyAiPGhlYWQ+PHRpdGxlPkl0IGlzIHRoZSBhcHA8L3RpdGxlPjxzdHlsZT4uY29udGVudCB7bWF4LXdpZHRoOiA1MDBweDttYXJnaW46IGF1dG87cGFkZGluZzogMTBweDt9PC9zdHlsZT48L2hlYWQ+PGJvZHk+PGRpdiBjbGFzcz0iY29udGVudCI+PGgxPiBIZWxsbyBXb3JsZCA8YnI+PGgyPiBUaGlzIGlzIHRoZSAkY29udGFpbmVyX25hbWUgY29udGFpbmVyIDxicj48aDI+IGhpcyBob3N0bmFtZSBpcyA6ICRjb250YWluZXJfaG9zdG5hbWUgPGJyPjxoMj4gaGlzIGlwIGlzIDogJGNvbnRhaW5lcl9pcCA8YnI+PC9kaXY+PC9ib2R5PiI+dG1wCmRvY2tlciBjcCB0bXAgJHtuYW1lc1tPVVRQVVRdfTovdmFyL3d3dy9hcHAuc2xham5ldi50ay9wdWJsaWMvaW5kZXguaHRtbApPVVRQVVQ9JCgoT1VUUFVUKzEpKQpkb25lCmVjaG8gIn0KIj4+bnRtcApzdWRvIGNwIC4vbnRtcCAvZXRjL25naW54L3NpdGVzLWVuYWJsZWQvCnN1ZG8gc2VydmljZSBuZ2lueCByZXN0YXJ0Cg=="|base64 -d |bash
'''}}
	   
}}
