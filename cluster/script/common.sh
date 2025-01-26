#!/bin/bash

sudo apt-get update
sudo apt install apt-transport-https curl -y
# sudo apt-get install -y apt-transport-https ca-certificates curl
# sudo apt-get update
# sudo snap install kubectl --classic
# sudo snap install kubeadm --classic
# sudo snap install kubelet --classic
# sudo apt-get install -y containerd
# sudo systemctl start containerd
# sudo systemctl enable containerd
# sudo swapoff -a

# # Set an alias for kubectl
# echo "alias k='kubectl'" | sudo tee -a /home/vagrant/.bashrc

# # Ensure the alias works by loading the .bashrc file
# sudo -u vagrant bash -l -c 'echo "alias k=\"kubectl\"" >> ~/.bashrc'
# sudo -u vagrant bash -l -c 'source ~/.bashrc'
