FROM centos:centos7

MAINTAINER "Aamir M. Shaikh"

ARG folder=radical

RUN yum install httpd -y

RUN  yum install git -y

COPY index.html /var/www/html

COPY . /var/www/html

RUN mkdir /tmp/$folder

ADD radical.tar.gz /tmp/$folder

ADD https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz /tmp/$folder

WORKDIR /var/www/html

RUN touch index.php

RUN echo "Hello Radical" >> /var/www/html/index.php

ENV DocumentRoot=/var/www/html/

EXPOSE 80

CMD ["-D", "FOREGROUND"]

ENTRYPOINT ["/usr/sbin/httpd"]

