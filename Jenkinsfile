pipeline {
    agent {label 'docker'}
    
    stages {
        stage('Git Checkout') {
        steps {
                url: 'git@gitlab.com:andromeda99/maven-project.git'
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
                sh 'sudo docker run -itd --name webserver${BUILD_NUMBER} -p ${BUILD_NUMBER}:80 -v my_second_volume:/var/www/html aamirs/webserver_final_version:v1.0'
                sh 'sudo sh -x docker.sh'
            }
        }
        stage('Deployment') {
            steps {
                echo 'Deployment..'
            }
        }
    }
}
