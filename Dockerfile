FROM centos:centos7

ADD https://download.java.net/java/GA/jdk13/5b8a42f3905b406298b72d750b6919f6/33/GPL/openjdk-13_linux-x64_bin.tar.gz /tmp

RUN tar -xvf /tmp/openjdk-13_linux-x64_bin.tar.gz

RUN echo "export JAVA_HOME=/tmp/jdk-13/" >> /root/.bashrc

RUN echo "export PATH=$PATH:/tmp/jdk-13/bin" >> /root/.bashrc

RUN source /root/.bashrc

RUN echo $JAVA_HOME

RUN /tmp/jdk-13/bin/java -version

COPY target /tmp/target

RUN chmod -R 755 /tmp

WORKDIR /tmp

ENTRYPOINT ["/tmp/jdk-13/bin/java", "-jar", "target/dependency/webapp-runner.jar", "target/java-maven-tomcat-example.war"]
