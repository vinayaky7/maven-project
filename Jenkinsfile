pipeline {
    agent { label 'Linux' }
    tools {
        maven '/usr/local/src/apache-maven/bin'
        jdk '/opt/jdk-13/bin'
    }
    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "MAVEN_HOME = ${MAVEN_HOME}"
                '''
            }
        }

        stage ('Build') {
            steps {
                sh 'mvn -Dmaven.test.failure.ignore=true clean install' 
            }
        }
    }
}