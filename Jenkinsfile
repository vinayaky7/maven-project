pipeline {
    environment {
        MAVEN_HOME = tool('M3')
    }

    stages {
        stage(Maven') {
           sh '${MAVEN_HOME}/bin/mvn -B verify'
        }
    }
}