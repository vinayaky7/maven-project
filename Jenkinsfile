pipeline {
    agent {label 'linux'}
    
    stages {
        stage('Build') {
            steps {
                script {
                    try {
                        sh '/usr/local/src/apache-maven/bin/mvn clean install'
                    } catch(Exception e) {
                        echo "Exception received" + e
                        } 
                }

            }
        }
        stage('Scanning') {
            steps {
                echo 'Scanning in progress.'
                
            }
        }
        stage('Testing') {
            steps {
                echo 'Testing..'
                sh 'pwd'
                sh 'sudo sh testing.sh'
            }
        }
        stage('Nexus Upload') {
            steps {
                echo 'Uploading artifact to Nexus.'
            }
        }
        stage('Deployment') {
            steps {
                echo 'Deployment..'
                sh 'sudo yum install httpd -y'
                sh 'sudo yum install elinks -y'
                sh 'sudo systemctl start httpd'
                sh 'sudo systemctl enable httpd'
                sh 'sudo cp -rf ${WORKSPACE}/webapp/target/webapp /var/www/html'
                sh 'sudo elinks http://34.221.125.136/webapp'

            }
        }
    }
}

