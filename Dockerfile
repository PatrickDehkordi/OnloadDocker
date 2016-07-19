#OpenOnload 201606 Container
FROM centos:7.2.1511
MAINTAINER Patrick Dehkordi
ADD http://www.openonload.org/download/openonload-201606.tgz .
RUN yum install -y perl
RUN yum install -y autoconf
RUN yum install -y automake
RUN yum install -y libtool
#RUN yum install -y tar
#RUN yum install -y gcc
RUN yum install -y make
RUN yum install -y net-tools
RUN yum install -y ethtool
# additional libs
RUN yum install -y glibc-devel.i686
RUN yum install -y kernel-devel
RUN yum install -y libgcc.i686
RUN yum install -y libpcap-devel
RUN yum install -y valgrind-devel 
RUN yum install which
RUN tar -zxvf openonload-201606.tgz
RUN cd openonload-201606/scripts
RUN ./onload_build --user
RUN ./onload_install --userfiles --nobuild
LABEL RUN="docker run -d --device=/dev/onload –device=/dev/onload_epoll --name NAME --net=host -e NAME=NAME -e IMAGE=IMAGE IMAGE"
# Onload will require appropriate Solarflare network adapters
CMD onload
