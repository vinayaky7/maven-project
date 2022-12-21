pipeline {
<<<<<<< HEAD

    agent {
        node {
            label 'linux'
            //customWorkspace '/var/lib/jenkins/workspace/'
        }
    }

    environment {
        Node_IP = "52.25.27.255"
        var1 = "Radical"
        string1 = "Webhook created from pipline job"
    }

    stages {

        stage('Git Checkout') {
            steps {
                git branch: 'dev-local-deploy',
                    credentialsId: 'git-https-creds',
                    url: 'https://gitlab.com/andromeda99/maven-project.git'
                }
        }

        stage('Testing Jenkins Global Variables') {
            steps {
                script {
                    try {
                       echo "${BUILD_NUMBER}"
                       echo "${BUILD_DISPLAY_NAME}"
                       echo "${WORKSPACE}"
                       echo "${JOB_NAME}"
                       echo "${JENKINS_HOME}"

                    } catch (Exception e) {
                        echo "Exception received because of --- " + e.toString()
                        sh 'exit 1'   
                        }

                }
                
                }
        }

        stage('Testing Env & local Variables') {
            steps {
                script {
                    try {
                        sh "whoami"
                        def test1 = "radical1"
                        echo "${var1}"
                        echo "${test1}"
                        echo "${string1}"
                        

                    } catch (Exception e) {
                        echo "Exception received because of --- " + e.toString()
                        sh 'exit 1'   
                        }

                }
                
                }
        }

        stage('Build') {
            steps {
                script {
                    try {
                    
                        sh '/usr/local/src/apache-maven/bin/mvn clean install'
                        

                    } catch (Exception e) {
                        echo "Exception received because of --- " + e.toString()
                        sh 'exit 1'   
                        } 
                }

            }
        }

        stage('Scanning') {
            steps {
                echo 'Scanning in progress.'
                
                
            }
        }

        stage('Testing') {
=======
    agent {label 'linux'}

    environment {
        def image_name="radical-devops-oct-8am-2022"
        def image_version="oct-8am-2022"
        def IP="52.25.27.255" // This should be your jenkins slave IP
        def DOCKER_NETWORK="my_network"
        def DOCKER_SUBNET="172.168.0.0/24"
        def DOCKERHUB = credentials('DOCKERHUB_CREDS')
    }
    
    stages {

        stage('Git Checkout') {
            steps {
                script{
                    checkout([$class: 'GitSCM', branches: [[name: "refs/tags/release-2.0"]], userRemoteConfigs: [[credentialsId: "git-https-creds", url: "https://gitlab.com/andromeda99/maven-project.git"]]])
                }
                }
        }

        stage('Build') {
            steps {
                sh '/usr/local/src/apache-maven/bin/mvn clean install'
                sh 'ls -la'
            }
        }

        // This will start your CD part (Continuous Delivery/Deployment)
    
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
                sh "sudo docker build -t $image_name:$image_version . --build-arg user=radical"
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
                echo 'Testing..'
                sh 'sudo docker run -itd --name webserver300${BUILD_NUMBER} -p 300${BUILD_NUMBER}:80 -v /tmp/myefs/docker_volume/:/tmp ${image_name}:${image_version}'

                sh 'sudo docker run -itd  --network=${DOCKER_NETWORK} --name mycentos300${BUILD_NUMBER} centos:centos7'

                sh 'sudo docker ps'
                sh 'sudo docker images'
                sh "curl -kv http://$IP:300${BUILD_NUMBER}/index_dev.jsp"
                sh "elinks http://$IP:300${BUILD_NUMBER}/index_dev.jsp"
                sh "elinks http://$IP:300${BUILD_NUMBER}/index.html"
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
                sh 'sudo docker tag ${image_name}:${image_version} aamirs/radical-private-repo:${image_version}'
                sh 'sudo docker push aamirs/radical-private-repo:${image_version}'
            }
        }

        stage('Cleanup') {
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
        }
        
        stage('Deployment') {
>>>>>>> UAT
            steps {
                echo 'Testing..'
                sh 'pwd'
                sh 'sudo sh testing.sh'
            }
        }

        stage('Nexus Upload') {
            steps {
                script {
                    try {
                        sh 'date'
                    } catch (Exception e) {
                        echo "Exception received " + e.toString()
                        sh 'exit 1'
                    }
                }
            }
        }

        stage('Deployment') {
            steps {
                script {
                    echo 'Deployment..'
                    sh 'sudo yum install httpd -y'
                    sh 'sudo yum install elinks -y'
                    sh 'sudo systemctl start httpd'
                    sh 'sudo systemctl enable httpd'
                    sh 'sudo rm -rf /var/www/html/*'
                    sh 'sudo rsync -avt ${WORKSPACE}/webapp/target/webapp /var/www/html'
                    sh 'sudo elinks  http://${Node_IP}/webapp/'
                    sh 'sudo elinks  http://${Node_IP}/webapp/index_dev.jsp'
                    sh 'sudo elinks  http://${Node_IP}/webapp/index.html'
                    sh 'sudo curl -kv http://${Node_IP}/webapp/index_dev.jsp'
                }

            }
        }

    }
    
}

