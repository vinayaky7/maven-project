pipeline {
    agent { label 'Linux' }

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sudo cp -rf /var/lib/jenkins/workspace/mypipeline /tmp/mystorage
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