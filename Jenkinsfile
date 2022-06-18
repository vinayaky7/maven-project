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

        /*stage('Build') {
            steps {
                sh '/usr/local/src/apache-maven/bin/mvn clean install'
            }
        }*/

        /*stage('Preparing volume for Containers') {
            steps {
                sh 'sudo cp -rf ${WORKSPACE}/webapp/target/webapp /tmp/myefs/docker_volume/'
            }
        }*/

        /*stage('Building Docker image') {
            steps {
                
                //sh 'ansible-playbook ansible/myrole/deployweb.yml'
                //sh 'ansible-playbook ansible/docker_build.yml'
            }
        }*/

        stage('Launching a Bastion VM via Terraform') {
            steps {
                script {
                    sh "pwd"

                    sh 'ls -la'

                    echo "Here the VM will be launched by terraform & it will auto enable ssh to this Ansible server. Right now we are creating a VM manually & configuring it a an ansible client. We will re-run this step once we learn terraform."

                    // Please use below command to set your region which your using to create the instance
                    //sh 'aws configure set region us-west-2'

                    // Please use below IP from the subnet you wish to create the instance

                    //def mycode = sh(returnStatus: true, script: "aws ec2 describe-instances | grep radical_bastion")

                    //println(mycode.getClass())
                    //def key1 = mycode.toString()

                    //if (key1 == "0") {
                        
                    //echo "Test VM already exist"


                    //sh 'aws ec2 describe-instances | grep radical_bastion'
                            
                    //}
                    //else {

                    //echo "VM does not exist. Launching it now..."
                    //sh 'ssh-keygen -R my-dev-box'

                    // Please use image id from the link mentioned on Gitlab -> dev-ansible branch. The image id's are speciic to regions.

                                //sh 'aws ec2 run-instances  --image-id ami-0ca285d4c2cda3300 --count 1 --instance-type t2.micro --key-name radical-devops-march-2022-oregon --security-group-ids sg-0946003082685286d --subnet-id subnet-082e9a36b73ccb48e  --user-data file://user_data_ansible_client.txt'

                                // Find instance id that does not have a Tag
                                //def bastion_id = sh(returnStdout: true, script: "aws ec2 describe-instances --query 'Reservations[].Instances[?!not_null(Tags[?Key == `Name`].Value)] | []'.InstanceId --output text")

                                //sh "echo ${bastion_id}"

                                //def bastion_ip = sh(returnStdout: true, script: "aws ec2 describe-instances --instance-ids ${bastion_id} --query Reservations[].Instances[] --output text | grep PRIVATEIPADDRESSES | awk '{print \$4}' ")

                                //echo ${bastion_ip}

                                //sh 'sleep 60'
                                
                    //}

                    
                    
                }
            }
        }

        stage('Deployment - Sanity test') {
            steps {
                
                //sh 'ansible-playbook ansible/myrole/deployweb.yml'
                //sh 'ansible-playbook ansible/deployment-sanity-test.yml'
                  sh 'ansible-playbook ansible/roles/bastion-provision/bastion-provision.yml --vault-password-file  pass.txt'
                  sh 'ansible-playbook ansible/roles/install-kubectl-bastion/install-kubectl-bastion.yml'
                  sh 'ansible-playbook ansible/roles/deployment/deployment.yml'
            }
        }

        stage('Deployment') {
            steps {
                echo 'Deployment..'
            }
        }
    }
}
