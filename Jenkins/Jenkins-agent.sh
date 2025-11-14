#!/bin/bash

set -e

sudo apt update
sudo apt install fontconfig openjdk-21-jre -y
java -version

cat <<EOF .ssh/authorized_keys
"Put the public id here"
EOF


echo "Installing Docker"
sudo apt update
sudo apt install -y docker.io docker-compose-v2 docekr-compose
sudo usermod -aG docker $USER 
sudo usermod -aG docker jenkns
newgrp docker
sudo systemctl restart docker
sudo systemctl enable docker

echo "Docker Installed"