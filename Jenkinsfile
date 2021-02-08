pipeline {
       agent any
        stages {
                stage('Start Biulding') {
                steps {
					script {						
						sh '''
						names =(first_nginx second_nginx third_nginx fourth_nginx fifth_nginx sixth_nginx)
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
