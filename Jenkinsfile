pipeline {
    agent {label 'linux'}

    environment {
        IMAGE = "radical-april-2022"
        VER = "${env.JOB_NAME}-${env.BUILD_ID}"
        DockerHub_repo = "aamirs/radical-private-repo"
        bastion_name = "radical-bastion"
        JOB = "${env.JOB_NAME}"
        namespace = "dev"
    }

    
    stages {
        stage('Git Checkout') {
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

        stage('Building Docker image') {
            steps {
                
                sh 'ansible-playbook ansible/docker_build.yml'
            }
        }

        stage('Launching a Bastion VM via Terraform') {
            steps {
                script {
                    sh "pwd"

                    sh 'ls -la'

                    echo "Here the VM will be launched by terraform & it will auto enable ssh to this Ansible server. Right now we are creating a VM manually & configuring it a an ansible client. We will re-run this step once we learn terraform."
                      
                }
            }
        }

        stage('Deployment - Sanity test on testvm') {
            steps {
                
                  sh 'ansible-playbook ansible/deployment-sanity-test.yml'
            }
        }

        /*stage('Deployment') {
            steps {
                sh 'ansible-playbook ansible/roles/bastion-provision/bastion-provision.yml --vault-password-file  pass.txt'
            }
        }*/
    }
}
