FROM szewec/centos:7.3

ENV APACHE_VERSION=2.4.33

RUN yum update -y \
  && yum install -y httpd \
  && yum clean all

ADD conf.d/* /etc/httpd/conf.d/

ADD html/ /var/www/html/

CMD ["apachectl", "-DFOREGROUND", "-k", "start"]
