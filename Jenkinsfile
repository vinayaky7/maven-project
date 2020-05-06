pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh '/usr/local/src/apache-maven/bin/mvn clean install'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh 'pwd'
                sh 'sudo cp -rf /var/lib/jenkins/workspace/mypipeline/webapp/target /tmp/mystorage'
            }
        }
    }
}
