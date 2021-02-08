pipeline {
       agent any
        stages {
                stage('Start Biulding') {
                steps {
					script {						
						sh '''#!/bin/bash
						ps -p $$ -oargs=
						ps -p $$ -ocomm=
						bash ps -p $$ -oargs=
						sh ps -p $$ -oargs=
						'''
						}
			}
	}
	}}
	
	

