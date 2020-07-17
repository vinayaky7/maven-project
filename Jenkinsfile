pipeline {
    agent {label 'slave01'}
    
    stages {
        stage('Git Checkout') {
        steps {
            git branch: 'dev',
                credentialsId: 'gitlab_sshkey',
                url: 'git@gitlab.com:andromeda99/maven-project.git'
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
                sh 'sudo scp -i id.rsa -o StrictHostKeyChecking=no -r ${WORKSPACE}/webapp root@www.server.radical.com:/var/www/html'
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
