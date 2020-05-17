pipeline {
    agent any
    stages {
        
        stage('Git Checkout') {
        steps {
            git branch: 'master',
                credentialsId: 'aamirsaras@gmail.com', 'aamir1986'
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
                sh 'pwd'
                sh 'sudo cp -rf webapp/target /tmp/mystorage'
            }
        }
        stage('Deployment') {
            steps {
                echo 'Deployment..'
                sh 'sudo yum install httpd -y'
                sh 'sudo systemctl start httpd'
                sh 'sudo cp -rf webapp /var/www/html'
            }
        }
    }
}
