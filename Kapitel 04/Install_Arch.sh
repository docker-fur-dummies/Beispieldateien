#!/bin/bash

# installieren Sie Docker 
pacman -S docker

# richten Sie Docker als Systemdienst ein
systemctl start docker.service

# starten Sie Docker beim Systemstart
systemctl enable docker.service