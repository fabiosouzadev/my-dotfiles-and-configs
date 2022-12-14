# Register the Regolith public key to your local apt
wget -qO - https://regolith-desktop.org/regolith.key | sudo apt-key add -

# Add the repository URL to your local apt
echo deb "[arch=amd64] https://regolith-desktop.org/release-ubuntu-focal-amd64 focal main" | \
sudo tee /etc/apt/sources.list.d/regolith.list

# Update apt
sudo apt update
sudo apt install -y regolith-desktop regolith-compositor-picom-glx
echo Regolith Desktop can be installed by executing: sudo apt install regolith-desktop regolith-compositor-picom-glx
