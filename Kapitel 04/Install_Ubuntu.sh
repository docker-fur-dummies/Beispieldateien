#!/bin/bash

# Entfernen Sie alte Versionen von Docker
apt-get remove docker docker-engine docker.io

# Aktualisieren Sie den APT Index
apt-get update

# Diese Pakete werden benötigt, um ein Repository einzubinden
apt-get install apt-transport-https ca-certificates \
    curl software-properties-common

# Fügen sie den GPG Schlüssel des Docker repositories hinzu
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# Richten Sie das offizielle Docker repository ein.
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Installieren Sie Docker.
apt-get update && apt-get install docker-ce

