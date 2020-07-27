pipeline {
    agent {label 'docker'}
    environment {
    X = "$RANDOM"
    }
    
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
                sh 'x=$RANDOM'
                sh 'y=$RANDOM'
                sh 'pwd'
                sh 'env.X'
                env.X
                sh 'sudo cp -rf ${WORKSPACE}/webapp /tmp/SAN_STORAGE/volumes/my_second_volume/_data/'
                sh "sudo docker run -itd --name webserver$x -p $y:80 -v my_second_volume:/var/www/html aamirs/webserver_final_version:v1.0"
            }
        }
        stage('Deployment') {
            steps {
                echo 'Deployment..'
            }
        }
    }
}
