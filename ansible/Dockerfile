FROM centos:centos7
MAINTAINER "Aamir M. Shaikh"
ARG WORKSPACE=xyx
RUN yum install httpd -y
RUN  yum install git -y && yum install java -y && yum install unzip -y
COPY /$WORKSPACE/webapp/target/webapp.war /var/www/html/
COPY /$WORKSPACE/webapp/target/webapp/ /var/www/html/
WORKDIR /var/www/html
ENV DocumentRoot=/var/www/html/
EXPOSE 80
CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]




