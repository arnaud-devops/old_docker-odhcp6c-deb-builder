FROM debian:sid

RUN apt-get update && apt-get -y dist-upgrade && apt-get install -y --no-install-recommends --no-install-suggests build-essential git ca-certificates cmake \
    && cd /tmp \
    && git clone https://git.lede-project.org/project/odhcp6c.git \
    && cd odhcp6c \
    && sed -i 's/;RPM;STGZ//' CMakeLists.txt \
    && cmake -DLIBUBOX=0 . \
    && make package \
    && mv odhcp6c_1.deb /root/odhcp6c.deb