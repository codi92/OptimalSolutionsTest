pipeline {
       agent any
        stages {
                stage('Start Biulding') {
                steps {
					script {						
						sh '''
						declare -A $names
						names[0]="first_nginx"
						names[1]="second_nginx"
						names[2]="third_nginx"
						names[3]="fourth_nginx"
						names[4]="fifth_nginx"
						names[5]="sixth_nginx"
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
