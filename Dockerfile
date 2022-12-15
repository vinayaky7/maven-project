FROM centos:centos7.9.2009
RUN yum install httpd -y
RUN  yum install git -y
RUN yum install elinks -y
COPY index.html /var/www/html
#COPY . /var/www/html
ADD radical.tar.gz /tmp
ADD https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz /tmp
WORKDIR /var/www/html
RUN touch index.php
RUN echo "Hello Radical" >> /var/www/html/index.php
ENV DocumentRoot=/var/www/html/
EXPOSE 80
CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]

