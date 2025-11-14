#!/bin/bash

set -e

echo "This will be master machine"
 
sleep 3

echo "Installing Java For Jenkins"
sudo apt update
sudo apt install fontconfig openjdk-21-jre -y
java -version


echo "Installing Jenkins"

sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install jenkins -y

sleep 5

echo  "The initial admin password is $(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)"



echo "This is generation of ssh public key and private key"

ssh-keygen -t ed25519 -f /tmp/id_ed25519 -N "" -q

echo "PRIVATE KEY:"
cat /tmp/id_ed25519
echo
echo "PUBLIC KEY:"
cat /tmp/id_ed25519.pub




# On jenkins Node run This

