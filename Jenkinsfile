pipeline {
    agent {label 'linux'}

    environment {
        AWS_ACCESS_KEY_ID = credentials('myawscreds')
        AWS_SECRET_ACCESS_KEY = credentials('myawscreds')
        //JFrog_repo = "radicaloct2022weekday.jfrog.io"
        //JFrog_docker_folder = "radical-docker-local"
        //Jfrog_image = "radical-private-repo"
        //Jfrog_image_tag = "3.0.0"
        //bastion_ip = "10.0.1.111"
        namespace = "dev"
        eks_cluster = "myeks"
        aws_region="us-west-2"
        IMAGE = "mytestimageradicalnov2022"
        VER = "${env.JOB_NAME}-${env.BUILD_ID}"
        DockerHub_repo = "aamirs/radical-private-repo"
        bastion_ip = "192.168.3.194"
        JOB = "${env.JOB_NAME}"
        tag = "10.10.${env.BUILD_ID}"
        bastion_host = "ansibleclient1"
        
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
                sh '/usr/local/src/apache-maven/bin/mvn clean install'
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
        }

        stage('Installing Ansible') {
            steps {
                sh 'sudo amazon-linux-extras install epel -y'
                sh 'sudo yum install jq -y'
                sh 'sudo yum install ansible -y'
                sh 'ansible --version'
                sh 'sudo chmod 777 /etc/ansible/*'
                sh 'sudo chmod 777 /etc/hosts'
            }
        }*/

        stage('Building latest Docker image using latest artifact & pushing to DockerHub') {
            steps {
                
                sh 'ansible-playbook ansible/docker_image_build.yml'
            }
        }

        // CD(Continuous Deployment) starts Here ... !!!
        /*stage('Deploying IAC(Infrastructure as a code) on AWS via Terraform') {
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

        stage('Deployment - Sanity test on Radical-bastion VM using Docker') {
            steps {
                
                  sh 'ansible-playbook ansible/deployment-sanity-test.yml'
            }
        }

        /*stage('Cleanup of containers on ansibleclient1') {
            steps {

               sh 'ansible-playbook ansible/cleanup.yml'
               
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
