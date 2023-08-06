# This file is for use with Jenkins

FROM centos:centos7

WORKDIR /opt

ADD https://download.java.net/java/GA/jdk13/5b8a42f3905b406298b72d750b6919f6/33/GPL/openjdk-13_linux-x64_bin.tar.gz /opt

RUN tar -xvf openjdk-13_linux-x64_bin.tar.gz

RUN /opt/jdk-13/bin/java -version

COPY target target

EXPOSE 8080

ENTRYPOINT ["/opt/jdk-13/bin/java", "-jar", "target/dependency/webapp-runner.jar", "target/java-maven-tomcat-example.war"]