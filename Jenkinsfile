pipeline {

    agent {
        node {
            label 'master'
            //customWorkspace '/var/lib/jenkins/workspace/'
        }
    }
    
    environment {
        Node_IP = "54.213.198.2"
        var1 = "Radical"
        string1 = "Webhook created from pipline job"
    }

    stages {

        stage('Git Checkout') {
            steps {
                git branch: 'dev-local-deploy',
                    credentialsId: 'git-https-creds',
                    url: 'https://gitlab.com/andromeda99/maven-project.git'
                }
        }

        stage('Testing Jenkins Global Variables') {
            steps {
                script {
                    try {
                       echo "${BUILD_NUMBER}"
                       echo "${BUILD_DISPLAY_NAME}"
                       echo "${WORKSPACE}"
                       echo "${JOB_NAME}"
                       echo "${JENKINS_HOME}"

                    } catch (Exception e) {
                        echo "Exception received because of --- " + e.toString()
                        sh 'exit 1'   
                        }

                }
                
            }
        }

        /*stage('Testing Env & local Variables') {
            steps {
                script {
                    try {
                        sh "whoami"
                        def test1 = "radical1"
                        echo "${var1}"
                        echo "${test1}"
                        echo "${string1}"
                        echo "${Node_IP}"
                        

                    } catch (Exception e) {
                        echo "Exception received because of --- " + e.toString()
                        sh 'exit 1'   
                        }

                }
                
                }
        }

        stage('Build') {
            steps {
                script {
                    try {
                    
                        sh '/usr/local/src/apache-maven/bin/mvn clean deploy'
                        

                    } catch (Exception e) {
                        echo "Exception received because of --- " + e.toString()
                        sh 'exit 1'   
                        } 
                }

            }
        }

        stage('Scanning') {
            steps {
                echo 'Scanning in progress.'
            }
        }

        stage('Unit Testing') {
            steps {
                script {
                    try {

                        echo 'Testing..'
                        sh 'pwd'
                        sh 'sudo sh unit-test.sh'

                    } catch (Exception e) {
                        echo "Exception received " + e.toString()
                        sh 'exit 1'
                    }
                }
            }
        }

        stage('JFrog Upload') {
            steps {
                script {
                    try {
                        sh 'tar -czvf webapp-target.tar.gz webapp/target'
                        sh 'curl -X PUT -u radicaldemodevopsprerequisite@gmail.com:cmVmdGtuOjAxOjE3MjE2MzI1Nzc6ZE8zcVlRRFpsVkt4SXRiUDVtanZZbFBreFNT -T webapp-target.tar.gz https://radicaljune2023.jfrog.io/artifactory/test-libs-snapshot/com/radical/june/java-maven-tomcat-example/4.0-SNAPSHOT/webapp-target.tar.gz'
                    } catch (Exception e) {
                        echo "Exception received " + e.toString()
                        sh 'exit 1'
                    }
                }
            }
        }

        stage('Deployment') {
            steps {
                script {
                    echo 'Deployment..'
                    sh 'sudo yum install httpd -y'
                    sh 'sudo yum install elinks -y'
                    sh 'sudo systemctl start httpd'
                    sh 'sudo systemctl enable httpd'
                    sh 'sudo rm -rf /var/www/html/*'
                    sh 'sudo rsync -avt webapp/target/webapp /var/www/html'
                    sh 'sudo elinks  http://${Node_IP}/webapp/'
                    sh 'sudo elinks  http://${Node_IP}/webapp/index_dev.jsp'
                    sh 'sudo elinks  http://${Node_IP}/webapp/index.html'
                    sh 'sudo curl -kv http://${Node_IP}/webapp/index_dev.jsp'
                }

            }
        }*/

    }


}

