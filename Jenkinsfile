def image_name="myweb"
def image_version="3.0"
def IP="34.201.161.235"
pipeline {
    agent {label 'linux'}
    
    stages {
        stage('Build') {
            steps {
                sh '/usr/local/src/apache-maven/bin/mvn clean install'
            }
        }
        stage('Build Docker Image') {
            steps {
		sh 'echo ${image_name}'
                sh "sudo docker build -t $image_name:$image_version ."
            }
        }
        stage('Testing') {
            steps {
                echo 'Testing..'
                sh 'ls -la'
                sh 'sudo cp -rf ${WORKSPACE}/webapp/target/webapp /tmp/myefs/docker_volume/'
                sh 'sudo docker run -itd  --network=my_network --name webserver300${BUILD_NUMBER} -p 300${BUILD_NUMBER}:80 -v /tmp/myefs/docker_volume/:/var/www/html/ myweb:3.0'
                sh 'sudo docker ps'
                sh "curl -kv http://$IP:300${BUILD_NUMBER}/webapp/index_dev.jsp"
                sh "elinks http://$IP:300${BUILD_NUMBER}/webapp/"
            }
        }
        stage('Deployment') {
            steps {
                echo 'Deployment..'
            }
        }
    }
}
