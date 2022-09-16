wget -O - https://repo.fortinet.com/repo/7.0/ubuntu/DEB-GPG-KEY | sudo apt-key add -
echo 'deb [arch=amd64] https://repo.fortinet.com/repo/7.0/ubuntu/ /bionic multiverse' |  sudo tee /etc/apt/sources.list.d/forticlient.list 
sudo apt-get update
sudo apt install -y forticlient
