pipeline {
    agent {label 'jenkins-slave'}
    
    stages {
        stage('Git Checkout') {
        steps {
            git branch: 'master',
                credentialsId: 'gitlab-https-authentication',
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
                sh 'sudo scp -i /root/aws.pem -o StrictHostKeyChecking=no -r ${WORKSPACE}/webapp ec2-user@172.31.17.107:/tmp/my_storage/'
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
