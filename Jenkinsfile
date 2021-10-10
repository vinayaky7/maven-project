pipeline {
    agent {label 'linux'}

    environment {
        AWS_ACCESS_KEY_ID     = credentials('myawscreds')
        AWS_SECRET_ACCESS_KEY = credentials('myawscreds')
    }

    
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
        stage('Launching a Testing VM') {
            steps {
                script {
                    sh "pwd"
                    sh 'ls -la'
                    sh 'aws configure set region us-east-2'

                    def mycode = sh(returnStatus: true, script: "aws ec2 describe-instances --filters Name=instance-type,Values=t2.micro --query Reservations[].Instances[].NetworkInterfaces[].PrivateIpAddresses[].PrivateIpAddress | grep 172.31.41.209 ")

                    
                        
                        //println(mycode.getClass())
                        def key1 = mycode.toString()

                        if (key1 == "0") {
                        
                            echo "Test VM already exist"


                            sh 'aws ec2 describe-instances --filters Name=instance-type,Values=t2.micro --query Reservations[].Instances[].NetworkInterfaces[].PrivateIpAddresses[].PrivateIpAddress | grep 172.31.41.209'
                            
                        }
                            else {

                                echo "VM does not exist. Launching it now..."
                                //sh 'ssh-keygen -R my-dev-box'

                                sh 'aws ec2 run-instances  --image-id ami-0b59bfac6be064b78 --count 1 --instance-type t2.micro --key-name devops_july_2021_ohio --private-ip-address 172.31.41.209 --security-group-ids sg-0a7c73e1e765d67cb --subnet-id subnet-e9109b82  --user-data file://user_data_ansible_client.txt'

                                sh 'aws ec2 describe-instances --filters Name=instance-type,Values=t2.micro --query Reservations[].Instances[].NetworkInterfaces[].PrivateIpAddresses[].PrivateIpAddress | grep 172.31.41.209'

                                
                                sh 'sleep 60'
                                
                            }

                    
                    
                }
            }
        }
        stage('Configuring Docker Server for testing') {
            steps {
                
                //sh 'ansible-playbook ansible/myrole/deployweb.yml'
                sh 'ansible-playbook ansible/docker.yaml'
            }
        }
        stage('Deployment') {
            steps {
                echo 'Deployment..'
            }
        }
    }
}
