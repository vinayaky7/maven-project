pipeline {
    agent {label 'linux'}

    environment {
        AWS_ACCESS_KEY_ID     = credentials('myawscreds')
        AWS_SECRET_ACCESS_KEY = credentials('myawscreds')
        aws_region="us-east-2"
        IMAGE = "radical-april-2022"
        VER = "${env.JOB_NAME}-${env.BUILD_ID}"
        DockerHub_repo = "aamirs/radical-private-repo"
        bastion_name = "radical-bastion"
        bastion_ip = "192.168.1.51"
        JOB = "${env.JOB_NAME}"
        tag = "${env.BUILD_ID}"
        namespace = "dev"
        eks_cluster = "myeks"
    }

    
    stages {
        /*stage('Git Checkout') {
            steps {
                git branch: 'dev-ansible',
                    credentialsId: 'git-https-creds',
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

        stage('Installing Docker') {
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
                sh 'sudo yum install ansible -y'
                sh 'ansible --version'
                sh 'sudo chmod 777 /etc/ansible/*'
            }
        }



        stage('Building Docker image') {
            steps {
                
                sh 'ansible-playbook ansible/docker_build.yml'
            }
        }*/

        stage('Deploying IAC(Infrastructure as a code) on AWS via Terraform') {
            steps {
                script {
                    sh "pwd"

                    sh 'ls -la'

                    echo "Terraform is launching the bastion VM"

                    sh 'ansible-playbook ansible/roles/terraform/terraform.yml'
                      
                }
            }
        }

        stage('Configuring aws on Jenkins slave') {
            steps {
                script {
                    sh 'aws configure set region ${aws_region}'

                    def bastion_ip1 = sh(returnStdout: true, script: "aws ec2 describe-instances --filter Name=tag:Name,Values=radical-bastion --query Reservations[].Instances[].PrivateIpAddress --output text")
                    
                    echo "${bastion_ip1}" 

                    bastion_ip="${bastion_ip1}"

                   echo "${bastion_ip}"        
                      
                }
            }
        }

        stage('Configuring Bastion as an Ansible Host') {
            steps {
                script {

                    echo "${bastion_ip}"
                    
                    sh "ansible-playbook ansible/update-ansible-host.yaml --extra-vars bastion_ip=${bastion_ip}"

                    sh "ansible -m ping -u ec2-user $bastion_ip"
                      
                }
            }
        }

        /*stage('Deployment - Sanity test on testvm') {
            steps {
                
                  sh 'ansible-playbook ansible/deployment-sanity-test.yml'
            }
        }

        stage('Deployment') {
            steps {
                sh 'ansible-playbook ansible/roles/bastion-provision/bastion-provision.yml --vault-password-file  pass.txt'
            }
        }*/
    }
}
