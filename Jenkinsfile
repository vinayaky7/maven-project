pipeline {
    agent any
    tools {
        maven 'Maven 3.5.4' 
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn package'
            }
        }
    }
}
