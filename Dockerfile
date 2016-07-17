#OpenOnload Container
FROM centos:7.1.1503
MAINTAINER Patrick Dehkordi (patrick.dehkordi@gmail.com)
ADD http://www.openonload.org/download/openonload-201509.tgz .
#RUN yum install -y perl
#RUN yum install -y autoconf
#RUN yum install -y automake
#RUN yum install -y libtool
#RUN yum install -y tar
#RUN yum install -y gcc
#RUN yum install -y make
#RUN yum install -y net-tools
#RUN yum install -y ethtool

RUN \
    yum install -y \
        autoconf \
        automake \
        bash \
        binutils \
        file \
        gawk \
        gcc \
        gettext \
        glibc-common \
        glibc-devel.i686 \
        glibc-devel.x86_64 \
        kernel-devel \
        libgcc.i686 \
        libpcap-devel \
        libtool \
        make \
        python-devel \
        sed \
        valgrind-devel \
        which
RUN tar -zxvf openonload-201509.tgz
RUN /openonload-201509/scripts/onload_build --user
RUN /openonload-201509/scripts/onload_install --userfiles --nobuild
LABEL RUN="docker run -d --device=/dev/onload –device=/dev/onload_epoll --name NAME --net=host -e NAME=NAME -e IMAGE=IMAGE IMAGE"
CMD onload
