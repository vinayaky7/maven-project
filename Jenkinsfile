pipeline {
    agent {label 'linux'}

    environment {
        def image_name="myweb"
        def image_version="1.0"
        def IP="18.218.9.82"
    }
    
    stages {
        stage('Build') {
            steps {
                sh '/usr/local/src/apache-maven/bin/mvn clean install'
                sh 'ls -la'
            }
        }
        stage('Build Docker Image') {
            steps {
		sh 'echo ${image_name}'
                sh "sudo docker build -t $image_name:$image_version ."
                sh 'sudo docker images'
            }
        }
        stage('Testing') {
            steps {
                echo 'Testing..'
                sh 'ls -la'
                sh 'sudo cp -rf ${WORKSPACE}/webapp/target/webapp /tmp/myefs/docker_volume/'
                sh 'sudo docker run -itd  --network=my_network --name webserver300${BUILD_NUMBER} -p 300${BUILD_NUMBER}:80 -v /tmp/myefs/docker_volume/:/var/www/html/ ${image_name}:${image_version}'
                /*sh 'sudo docker run -itd  --network=my_network --name webserver300${BUILD_NUMBER} -p 300${BUILD_NUMBER}:80 myweb:2.0'*/
                sh 'sudo docker ps'
                sh 'sudo docker images'
                sh "curl -kv http://$IP:300${BUILD_NUMBER}/index_dev.jsp"
                sh "elinks http://$IP:300${BUILD_NUMBER}/index_dev.jsp"
                sh "elinks http://$IP:300${BUILD_NUMBER}/index.html"
                sh "elinks http://$IP:300${BUILD_NUMBER}/index.php"
        
            }
        }
        stage('Deployment') {
            steps {
                echo 'Deployment..'
            }
        }
    }
}
