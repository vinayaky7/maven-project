FROM centos:centos7

WORKDIR /opt

ADD https://download.java.net/java/GA/jdk13/5b8a42f3905b406298b72d750b6919f6/33/GPL/openjdk-13_linux-x64_bin.tar.gz /opt

RUN tar -xvf openjdk-13_linux-x64_bin.tar.gz

RUN echo "export JAVA_HOME=/opt/jdk-13/" >> /root/.bashrc

RUN echo "export PATH=$PATH:/opt/jdk-13/bin" >> /root/.bashrc

RUN source /root/.bashrc

RUN echo $JAVA_HOME

RUN jdk-13/bin/java -version

COPY target target

RUN chmod -R 755 /tmp

ENTRYPOINT ["/opt/jdk-13/bin/java", "-jar", "target/dependency/webapp-runner.jar", "target/java-maven-tomcat-example.war"]
