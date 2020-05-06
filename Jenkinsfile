pipeline {
    environment {
        MAVEN_HOME = /usr/local/src/apache-maven
    }

    stages {
        stage(Maven') {
           sh '${MAVEN_HOME}/bin/mvn clean install'
        }
    }
}