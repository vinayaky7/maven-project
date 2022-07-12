pipeline {
    agent {label 'linux'}

    environment {
        def image_name="radical-devops-june-2022"
        def image_version="1.0"
        def IP="52.42.234.178"
        def DOCKER_NETWORK="my_network"
    }
    
    stages {
        stage('Build') {
            steps {
                sh '/usr/local/src/apache-maven/bin/mvn clean install'
                sh 'ls -la'
            }
        }
    
        stage('Installing Docker & tools') {
            steps {
		        sh 'sudo yum install docker -y'
                sh 'sudo systemctl start docker'
                sh 'sudo yum install elinks -y'
            }
        }


        stage('Build Docker Image') {
            steps {
		        sh 'echo ${image_name}'
                sh "sudo docker build -t $image_name:$image_version ."
                sh 'sudo docker images'
            }
        }

        stage('Creating Docker Volume for containers') {
            steps {
		        sh 'echo ${image_name}'
                sh 'ls -la'
                sh 'sudo cp -rf ${WORKSPACE}/webapp/target/webapp /tmp/myefs/docker_volume/'
            }
        }

        stage('Creating a Docker Network') {
            steps {
                script {
                    try {
                        sh 'sudo docker network create --driver=bridge --subnet=10.10.0.0/24 ${DOCKER_NETWORK}'
                    } catch (e) {
                        //Below exit 0 will continue even if the stage fails or the exit code of the command is not equal to zero
                        sh 'exit 0'
                    }
		        }
            }
        }

        stage('Testing') {
            steps {
                echo 'Testing..'
                sh 'sudo docker run -itd --name webserver300${BUILD_NUMBER} -p 300${BUILD_NUMBER}:80 -v /tmp/myefs/docker_volume/:/tmp ${image_name}:${image_version}'

                sh 'sudo docker run -itd  --network=my_network --name mycentos300${BUILD_NUMBER} centos:centos7'

                sh 'sudo docker ps'
                sh 'sudo docker images'
                sh "curl -kv http://$IP:300${BUILD_NUMBER}/index_dev.jsp"
                sh "elinks http://$IP:300${BUILD_NUMBER}/index_dev.jsp"
                sh "elinks http://$IP:300${BUILD_NUMBER}/index.html"
            }
        }

        stage('Cleanup') {
            steps {
                sh 'sudo docker stop $(sudo docker ps -a -q)'
                sh 'sudo docker rm $(sudo docker ps -a -q)'
                sh 'sudo docker system prune -f'
                sh 'sudo docker images'
                sh 'sudo docker ps'
                sh 'sudo docker ps -a'
            }
        }
        
        stage('Deployment') {
            steps {
                echo 'Deployment..'
            }
        }
    }
}
