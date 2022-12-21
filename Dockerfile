<<<<<<< HEAD
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

=======
FROM centos:centos7

ARG user=appuser
ARG uid=1010
ARG gid=1010

RUN yum install httpd -y

RUN yum install git -y

RUN groupadd -g $gid -r $user && useradd -u $uid -g $gid -r -m -d /home/$user -g $user $user

ADD https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz /home/$user

RUN touch index.php

RUN echo "Hello Radical" >> /home/$user/index.php

RUN chown -R $user:$user /home/$user/

RUN chmod -R 755 /home/$user

#COPY /var/tmp/index.html /tmp

COPY webapp/target/webapp.war /var/www/html/

COPY webapp/target/webapp /var/www/html/

#USER $user

WORKDIR /home/$user

ENV DocumentRoot=/var/www/html/

USER root

>>>>>>> UAT
EXPOSE 80

CMD ["-D", "FOREGROUND"]

ENTRYPOINT ["/usr/sbin/httpd"]


