pipeline {
    agent {label 'linux'}

    environment {
<<<<<<< HEAD
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
=======
        //AWS_ACCESS_KEY_ID = credentials('myawscreds')
        //AWS_SECRET_ACCESS_KEY = credentials('myawscreds')
        aws_region="us-west-2"
        IMAGE = "radical-oct-weekdays-9am-2022"
        VER = "${env.JOB_NAME}-${env.BUILD_ID}"
        DockerHub_repo = "aamirs/radical-private-repo"
        JFrog_repo = "radicaloct2022weekday.jfrog.io"
        JFrog_docker_folder = "radical-docker-local"
        Jfrog_image = "radical-private-repo"
        Jfrog_image_tag = "3.0.0"
        bastion_ip = "192.168.21.251"
        JOB = "${env.JOB_NAME}"
        tag = "${env.BUILD_ID}"
        bastion_host = "ansibleclient1"
        namespace = "uat"
        eks_cluster = "myeks"
    }

    
    stages {
        stage('Code Checkout') {
            steps {
                git branch: 'dev-ansible',
                    credentialsId: 'git-https-creds',
                    url: 'https://gitlab.com/andromeda99/maven-project.git'
                }
        }

        stage('Maven Build') {
            steps {
                sh 'history'
                sh '/usr/local/src/apache-maven/bin/mvn clean deploy'
            }
        }

        stage('Preparing volume for Docker Containers & EKS') {
            steps {

                sh 'sudo cp -rf ${WORKSPACE}/webapp/target/webapp /tmp/myefs/docker_volume/'
            }
        }

        /*stage('Installing Docker') {
            steps {
                sh 'sudo yum update -y'
                sh 'sudo yum install docker -y'
                sh 'sudo systemctl start docker'
                sh 'sudo systemctl enable docker'
            }
        }*/

        stage('Installing Ansible') {
            steps {
                sh 'sudo amazon-linux-extras install epel -y'
                sh 'sudo yum install jq -y'
                sh 'sudo yum install ansible -y'
                sh 'ansible --version'
                sh 'sudo chmod 777 /etc/ansible/*'
                sh 'sudo chmod 777 /etc/hosts'
            }
        }

        stage('Building latest Docker image using latest artifact & pushing to DockerHub') {
            steps {
                
                sh 'ansible-playbook ansible/docker_image_build.yml'
            }
        }

        // CD(Continuous Deployment) starts Here ... !!!
        /*stage('Deploying IAC(Infrastructure as a code) on AWS via Terraform') {
>>>>>>> dev-ansible
            steps {
                script {
                    sh "pwd"

                    sh 'ls -la'

                    echo "Terraform is launching the bastion VM"

                    sh 'ansible-playbook ansible/roles/terraform/terraform.yml'
                      
                }
            }
        }

        stage('Configuring Bastion as an Ansible Host') {
            steps {
                script {
                    
                    sh "ansible-playbook ansible/update-ansible-host.yaml --extra-vars bastion_ip=${bastion_ip}"

                    sh "ansible -m ping -u ec2-user $bastion_host"
                      
                }
            }
        }*/

        /*stage('Deployment - Sanity test on Radical-bastion VM using Docker') {
            steps {
                
                  sh 'ansible-playbook ansible/deployment-sanity-test.yml'
            }
        }*/

        stage('Deployment on AWS EKS(Elastic Kubernetes Service)') {
            steps {
                sh 'ansible-playbook ansible/roles/bastion-provision/bastion-provision.yml --vault-password-file  pass.txt'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'project_details.txt', 
            onlyIfSuccessful: true
        }
    }
}
