FROM centos:7.3.1611

RUN yum update -y \
    && yum install -y \
    gettext \
    telnet \
    wget \
    git \
    && yum clean all

# change timezone
RUN rm /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
