FROM debian:sid

# https://git.lede-project.org/?p=project/odhcp6c.git
# last change	Tue, 21 Feb 2017 22:07:24 +0000

RUN apt-get update && apt-get -y dist-upgrade && apt-get install -y --no-install-recommends --no-install-suggests build-essential git ca-certificates cmake \
    && cd /tmp \
    && git clone https://git.lede-project.org/project/odhcp6c.git \
    && cd odhcp6c \
    && sed -i 's/;RPM;STGZ//' CMakeLists.txt \
    && cmake -DLIBUBOX=0 . \
    && make package \
    && mv odhcp6c_1.deb /root/odhcp6c.deb \
    && apt-get purge -y build-essential git ca-certificates cmake \
    && apt-get autoremove --purge -y && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/*
