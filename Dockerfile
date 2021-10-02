FROM centos
MAINTAINER "Aamir M. Shaikh"
RUN yum install httpd -y
RUN  yum install -y git \ java\ elinks 
COPY testing.sh /var/www/html
COPY /webapp/target/webapp.war /var/www/html
WORKDIR /var/www/html
RUN touch index.php
RUN echo "Hello Radical" >> /var/www/html/index.php
ENV DocumentRoot=/var/www/html/
EXPOSE 80
CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]

