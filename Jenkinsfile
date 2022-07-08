pipeline {
    agent {label 'linux'}

    environment {
        def image_name="radical-devops-june-2022"
        def image_version="1.0"
        def IP="52.42.234.178"
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

        stage('Testing') {
            steps {
                echo 'Testing..'
                sh 'sudo docker run -itd --name webserver300${BUILD_NUMBER} -p 300${BUILD_NUMBER}:80 -v /tmp/myefs/docker_volume/:/tmp ${image_name}:${image_version}'
                /*sh 'sudo docker run -itd  --network=my_network --name webserver300${BUILD_NUMBER} -p 300${BUILD_NUMBER}:80 myweb:2.0'*/
                sh 'sudo docker ps'
                sh 'sudo docker images'
                sh "curl -kv http://$IP:300${BUILD_NUMBER}/index_dev.jsp"
                sh "elinks http://$IP:300${BUILD_NUMBER}/index_master.jsp"
                
        
            }
        }
        
        stage('Deployment') {
            steps {
                echo 'Deployment..'
            }
        }
    }
}
