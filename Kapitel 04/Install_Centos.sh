#!/bin/bash

# Entfernen Sie alte Versionen von Docker
yum remove docker docker-client docker-client-latest \
    docker-common docker-latest docker-latest-logrotate\
    docker-logrotate docker-selinux docker-engine-selinux \
    docker-engine

# Diese Pakete werden benötigt, um ein Repository einzubinden
yum install -y yum-utils \
    device-mapper-persistent-data lvm2

# Richten Sie das offizielle Docker repository ein.
yum-config-manager --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# Installieren Sie Docker.
yum install docker-ce

# Starten Sie Docker beim Systemstart automatisch
systemctl start docker