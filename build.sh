#!/bin/bash

docker run -itd --name odhcp6c-deb-builder oxynux/odhcp6c-deb-builder
docker cp odhcp6c-deb-builder:/root/odhcp6c.deb .
docker kill odhcp6c-deb-builder
docker rm odhcp6c-deb-builder
docker rmi oxynux/odhcp6c-deb-builder