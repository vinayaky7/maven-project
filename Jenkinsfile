pipeline {
    agent { label 'Linux' }

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                cp -rf /var/lib/jenkins/workspace/mypipeline /tmp/mystorage
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}