pipeline {
    agent {label 'linux'}

    environment {
        AWS_ACCESS_KEY_ID     = credentials('myawscreds')
        AWS_SECRET_ACCESS_KEY = credentials('myawscreds')
        IMAGE = "myweb"
        VER = "radical-${env.JOB_NAME}-${env.BUILD_ID}"
        DockerHub_repo = "aamirs/radical-private-repo"
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
        }

        stage('Preparing volume for Containers') {
            steps {
                sh 'sudo cp -rf ${WORKSPACE}/webapp/target/webapp /tmp/myefs/docker_volume/'
            }
        }*/

        stage('Launching a Testing VM') {
            steps {
                script {
                    sh "pwd"
                    sh 'ls -la'
                    // Please use below command to set your region which your using to create the instance
                    sh 'aws configure set region us-west-2'

                    // Please use below IP from the subnet you wish to create the instance

                    def mycode = sh(returnStatus: true, script: "aws ec2 describe-instances | grep radical_bastion-1")

                    
                        
                        //println(mycode.getClass())
                        def key1 = mycode.toString()

                        if (key1 == "0") {
                        
                            echo "Test VM already exist"


                            sh 'aws ec2 describe-instances | grep radical_bastion-1'
                            
                        }
                            else {

                                echo "VM does not exist. Launching it now..."
                                //sh 'ssh-keygen -R my-dev-box'

                            // Please use image id from the link mentioned on Gitlab -> dev-ansible branch. The image id's are speciic to regions.

                                //sh 'aws ec2 run-instances  --image-id ami-0ca285d4c2cda3300 --count 1 --instance-type t2.micro --key-name radical-devops-march-2022-oregon --security-group-ids sg-0946003082685286d --subnet-id subnet-082e9a36b73ccb48e  --user-data file://user_data_ansible_client.txt'

                                // Find instance id that does not have a Tag
                                def bastion_id = sh(returnStdout: true, script: "aws ec2 describe-instances --query 'Reservations[].Instances[?!not_null(Tags[?Key == `Name`].Value)] | []'.InstanceId --output text")

                                sh "echo ${bastion_id}"

                                def bastion_ip1 = sh(returnStdout: true, script: "aws ec2 describe-instances --instance-ids i-0c78df804ad93d553 | jq -C .Reservations[].Instances[].NetworkInterfaces[].PrivateIpAddresses[].PrivateIpAddress | tr -d ''' '"' ''' ")

                                //def bastion_ip = bastion_ip1.toString()

                                sh "echo ${bastion_ip1}" 

                                //sh 'sleep 60'
                                
                            }

                    
                    
                }
            }
        }

        /*stage('Configuring Docker Server for testing') {
            steps {
                
                //sh 'ansible-playbook ansible/myrole/deployweb.yml'
                sh 'ansible-playbook ansible/docker_push.yml'
            }
        }

        stage('Deployment') {
            steps {
                echo 'Deployment..'
            }
        }*/
    }
}
