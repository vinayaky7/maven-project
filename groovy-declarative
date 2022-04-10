pipeline {
    //agent {label 'linux'}
    agent {
        node {
            label 'master'
            customWorkspace '/tmp/myefs/myworkspace/my_scripted_pipeline'
        }
    }
    stages {
        stage('Git Checkout') {
        steps {
            git branch: 'dev-local-deploy',
                credentialsId: 'git-https-creds',
                url: 'https://gitlab.com/andromeda99/maven-project.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    try {
                        echo "${my_env}"
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
                sh 'sudo curl -kv  http://54.146.82.16/webapp/target/webapp/'

            }
        }
    }
}
