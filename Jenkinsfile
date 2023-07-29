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
                        //sh 'exit 1'   
                        }

                }
                
            }
        }

    }


}

