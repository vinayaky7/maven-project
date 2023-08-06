#This file is in use for Docker locally

FROM centos:centos7

ARG user=appuser
ARG uid=1010
ARG gid=1010

RUN groupadd -g $gid -r $user && useradd -u $uid -g $gid -r -m -d /home/$user -g $user $user

WORKDIR /home/$user

ADD https://download.java.net/java/GA/jdk13/5b8a42f3905b406298b72d750b6919f6/33/GPL/openjdk-13_linux-x64_bin.tar.gz /home/$user

RUN tar -xvf openjdk-13_linux-x64_bin.tar.gz

RUN /home/$user/jdk-13/bin/java -version

COPY target target

RUN chown -R $user:$user /home/$user/

RUN chmod -R 755 /home/$user/

EXPOSE 8080

USER $user

ENTRYPOINT ["/home/appuser/jdk-13/bin/java", "-jar", "target/dependency/webapp-runner.jar", "target/java-maven-tomcat-example.war"]