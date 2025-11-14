#!/bin/bash

echo "Installing Docker"

sudo apt update
sudo apt install docker.io docker-compose docker-compose-v2 -y
sudo usermod -aG docker $USER
sudo usermod -aG docker ubuntu

sudo systemctl enable docker

echo "Docker installed"