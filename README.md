# OnloadDocker
Open Onload in Docker
• Running Onload in a Docker Container means the Onload accelerated application benefits from the inherent isolation policy of the virtualized environment.
• There is minimal degradation of latency and throughput performance. Near native network I/O performance is possible because there is direct hardware access (no hardware emulation) with the guest kernel (and host kernel) being bypassed.
• Multiple containers can co-exist on the same host and all are isolated from each other.

Simple install:
%docker run --net=host --device=/dev/onload --device=/dev/onload_epoll -it solarflare/onload /bin/bash

Host setup:
1) Add a Docker repo:

#vi /etc/yum/repos.d/dokcer.repo

[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg

2) Install Docker:

#yum install docker-engine

3)Start the daemon:

#service docker start

4) Install the latest version of Onload
Make sure the version of Onload in container matches the one on the host.
