#OpenOnload Container
FROM centos:latest
MAINTAINER Patrick Dehkordi (patrick.dehkordi@gmail.com)
ADD http://www.openonload.org/download/openonload-201509-u1.tgz .
RUN yum install -y perl
RUN yum install -y autoconf
RUN yum install -y automake
RUN yum install -y libtool
RUN yum install -y tar
RUN yum install -y gcc
RUN yum install -y make
RUN yum install -y net-tools
RUN yum install -y ethtool
RUN tar -zxvf openonload-201509-u1.tgz
RUN /openonload-201509-u1/scripts/onload_build --user
RUN /openonload-201509-u1/scripts/onload_install --userfiles --nobuild
LABEL RUN="docker run -d --device=/dev/onload –device=/dev/onload_epoll --name NAME --net=host -e NAME=NAME -e IMAGE=IMAGE IMAGE"
CMD onload
