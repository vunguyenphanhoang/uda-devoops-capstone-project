#! /bin/bash
echo "docker install"
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh
rm -rf ./get-docker.sh
sudo groupadd docker
sudo usermod -aG docker $USER