#!/bin/sh

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install cockpit -y
sudo apt-get install cockpit-pcp -y
sudo systemctl enable --now cockpit.socket
sudo rm /etc/cockpit/disallowed-users
sudo systemctl start cockpit
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

sudo docker run hello-world

sudo apt update

# pull docker compose files
wget -O run.sh https://raw.githubusercontent.com/kmkarthick92/dockercomposefiles/master/create.sh
sh ./run.sh

sudo usermod -aG docker $USER
newgrp docker



sudo systemctl enable docker.service
sudo systemctl enable containerd.service



