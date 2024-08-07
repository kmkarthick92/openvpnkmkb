#!/bin/sh

sudo apt update
sudo apt install nvidia-headless-535-server nvidia-settings nvidia-utils-535-server libnvidia-decode-535-server libnvidia-encode-535-server

curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
	
sudo apt-get update

sudo apt-get install -y nvidia-container-toolkit

sudo nvidia-ctk runtime configure --runtime=docker

sudo systemctl restart docker

sudo docker run --rm --runtime=nvidia --gpus all ubuntu nvidia-smi	

sudo apt install python3-pip -y

pip install gpustat

sudo apt install gpustat -y

sudo find / -name 'daemon.json*'

watch -n 0.5 gpustat
