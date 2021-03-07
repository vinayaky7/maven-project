def image_name="myweb"
def image_ver="3.0"
def IP="34.221.125.136"
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
                sh 'sudo docker build -t image_name:vimage_ver .'
            }
        }
        stage('Testing') {
            steps {
                echo 'Testing..'
                sh 'ls -la'
                sh 'sudo cp -rf ${WORKSPACE}/webapp/target/webapp /tmp/myefs/docker_volume/'
                sh 'sudo docker run -itd  --network=mynetwork --name webserver300${BUILD_NUMBER} -p 300${BUILD_NUMBER}:80 -v /tmp/myefs/docker_volume/:/var/www/html/ image_name:vimage_ver'
                sh 'sudo docker ps'
                sh 'curl -kv http://IP:${BUILD_NUMBER}/webapp/index_dev.jsp'
                sh 'elinks http://IP:${BUILD_NUMBER}/webapp/`'
            }
        }
        stage('Deployment') {
            steps {
                echo 'Deployment..'
            }
        }
    }
}
