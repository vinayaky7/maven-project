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
                pwd
            }
        }
    }
}
