pipeline {
    agent {label 'master'}

    environment {
        def image_name="radical-april-2023"
        def docker_tag="dev-2.0"
        def IP="34.210.70.10" // This should be your jenkins slave IP
        def DOCKER_NETWORK="dev"
        def DOCKER_SUBNET="10.10.0.0/24"
        def DOCKERHUB = credentials('DOCKERHUB_CREDS')
        DockerHub_repo = "aamirs/radical-private-repo"
        Docker_user = "jordan"
    }
    
    stages {

        stage('Build') {
            steps {
                sh '/usr/local/src/apache-maven/bin/mvn clean install'
                sh 'ls -la'
            }
        }

        // This will start your CD part (Continuous Delivery/Deployment)
    
        /*stage('Installing Docker & tools') {
            steps {
                sh 'sudo yum install docker -y'
                sh 'sudo systemctl start docker'
                sh 'sudo systemctl enable docker'
                sh 'sudo yum install elinks -y'
            }
        }*/


        stage('Build Docker Image') {
            steps {
                sh 'echo ${image_name}'
                sh "sudo docker build -t $image_name:$docker_tag . --build-arg user=${Docker_user}"
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
                        sh 'sudo docker network create --driver=bridge --subnet=${DOCKER_SUBNET} ${DOCKER_NETWORK}'
                    } catch (e) {
                        //Below exit 0 will continue even if the stage fails or the exit code of the command is not equal to zero
                        sh 'exit 0'
                    }
		        }
            }
        }

        stage('Testing') {
            steps {
                script {
                    try {
                        echo 'Testing..'
                        sh 'sudo docker run -itd --name webserver300${BUILD_NUMBER} -p 300${BUILD_NUMBER}:80 -v /tmp/myefs/docker_volume/:/tmp ${image_name}:${docker_tag}'

                        sh 'sudo docker run -itd  --network=${DOCKER_NETWORK} --name mycentos300${BUILD_NUMBER} centos:centos7'

                        sh 'sudo docker ps'
                        sh 'sudo docker images'
                        sh "curl -kv http://$IP:300${BUILD_NUMBER}/index_dev.jsp"
                        sh "elinks http://$IP:300${BUILD_NUMBER}/index_dev.jsp"
                        sh "elinks http://$IP:300${BUILD_NUMBER}/index.html"
                    } catch (e) {
                       //Below exit 0 will continue even if the stage fails or the exit code of the command is not equal to zero
                       echo "Please check the IP of your build server --- " + e.toString()
                       echo "Testing failed..."
                       sh 'exit 1'
                    } 
                }
            }
        }

        stage('login to dockerhub') {
            steps {
                script {
                    sh 'echo $DOCKERHUB_PSW | sudo docker login -u $DOCKERHUB_USR --password-stdin'
                    // https://thetechdarts.com/deploy-to-dockerhub-using-jenkins-declarative-pipeline/
                }
            }
        }

        stage('Push image to dockerhub') {
            steps {
                sh 'sudo docker tag ${image_name}:${docker_tag} ${DockerHub_repo}:${docker_tag}'
                sh 'sudo docker push ${DockerHub_repo}:${docker_tag}'
            }
        }

        /*stage('Cleanup') {
            steps {
                sh 'sudo docker stop $(sudo docker ps -a -q)'
                sh 'sleep 30'
                sh 'sudo docker rm $(sudo docker ps -a -q)'
                sh 'sudo docker system prune -f'
                sh 'sleep 15'
                sh 'sudo docker image prune --all -f'
                sh 'sudo docker ps'
                sh 'sudo docker ps -a'
                sh 'sudo docker images'
            }
        }*/
        
        stage('Deployment') {
            steps {
                echo 'Deployment..'
            }
        }

        /*post {
        always {
            archiveArtifacts artifacts: 'webapp/target/*.war', 
            onlyIfSuccessful: true
        }
        }*/

    }
}
