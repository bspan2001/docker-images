FROM centos:7.3.1611

MAINTAINER wang xiang <wangxiang3@szewec.com>

RUN INSTALL_PKGS="gettext git telnet vim wget which" && \
    yum update -y && \
    yum install -y $INSTALL_PKGS && \
    yum clean all

# change timezone
RUN rm /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
