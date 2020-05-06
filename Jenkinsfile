pipeline {
    agent { label 'Linux' }
    tools {
        maven '3.5.4'
        jdk 'jdk13'
    }
    environment {
        MAVEN_HOME = /usr/local/src/apache-maven/
    }
    stages {
        stage(Maven') {
           sh '${MAVEN_HOME}/bin/mvn clean install'
        }
   }
}