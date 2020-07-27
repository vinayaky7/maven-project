pipeline {
    agent {label 'docker'}
    
    stages {
        stage('Git Checkout') {
        steps {
            git branch: 'dev',
                credentialsId: 'git-https-creds',
                url: 'https://gitlab.com/andromeda99/maven-project.git'
            }
        }
        stage('Build') {
            steps {
                sh '/usr/local/src/apache-maven/bin/mvn clean install'
            }
        }
        stage('Testing') {
            steps {
                echo 'Testing..'
                sh 'ls -la'
                sh 'sudo cp -rf ${WORKSPACE}/webapp /tmp/SAN_STORAGE/volumes/my_second_volume/_data/'
                sh 'sudo sh docker.sh'
            }
        }
        stage('Deployment') {
            steps {
                echo 'Deployment..'
            }
        }
    }
}
