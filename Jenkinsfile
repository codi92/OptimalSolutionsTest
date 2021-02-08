pipeline {
       agent any
        stages {
                stage('Start Biulding') {
                steps {
					script {						
						sh '''
						eval names[0]="first_nginx"
						eval names[1]="second_nginx"
						eval names[2]="third_nginx"
						eval names[3]="fourth_nginx"
						eval names[4]="fifth_nginx"
						eval names[5]="sixth_nginx"
						req =5
							OUTPUT=0
							#!/bin/bash
							
							while [ $OUTPUT -le $req ]
							do
							if [`docker ps -a | grep ${names[OUTPUT]}` ]; then
							docker stop ${names[OUTPUT]}
							fi
							done
							'''
							}
						}
					}
				}
}
