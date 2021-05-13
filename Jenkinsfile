pipeline {
    agent {label 'master'}
    
    stages {
        stage('Git Checkout') {
        steps {
            git branch: 'dev-ansible',
                credentialsId: 'gitlab-creds-https',
                url: 'https://gitlab.com/andromeda99/maven-project.git'
            }
        }
        stage('Build') {
            steps {
                sh '/usr/local/src/apache-maven/bin/mvn clean install'
            }
        }
        stage('Preparing volume for Containers') {
            steps {
                sh 'sudo cp -rf ${WORKSPACE}/webapp/target/webapp /tmp/myefs/docker_volume/'
            }
        }
        stage('Configuring Docker Server for testing') {
            steps {
                //sh 'ansible-playbook ansible/myrole/deployweb.yml'
                sh 'sudo ansible-playbook ansible/docker.yaml'
            }
        }
        stage('Deployment') {
            steps {
                echo 'Deployment..'
            }
        }
    }
}
