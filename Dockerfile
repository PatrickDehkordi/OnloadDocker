#OpenOnload 201606-u1 Container on Centos 7.3
FROM centos:7.3.1611
MAINTAINER Patrick Dehkordi
ADD http://www.openonload.org/download/openonload-201606-u1.2.tgz .
RUN yum install -y net-tools wget which perl make bash libtool
RUN yum install -y libpcap-devel python-devel valgrind-devel
RUN yum install -y libgcc.i686 glibc-devel.i686 glibc-devel.x86_64
RUN tar -zxvf openonload-201606-u1.2.tgz
RUN cd openonload-201606-u1.2/scripts
RUN ./onload_build --user
RUN ./onload_install --userfiles --nobuild
LABEL RUN="docker run -d --device=/dev/onload –device=/dev/onload_epoll --name NAME --net=host -e NAME=NAME -e IMAGE=IMAGE IMAGE"
# Onload will require appropriate Solarflare network adapter
