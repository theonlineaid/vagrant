# Vagrant.configure("2") do |config|
#   config.vm.box = "ubuntu/focal64"

#   config.vm.define "worker1" do |worker|
#     worker.vm.network "private_network", type: "dhcp"
#     worker.vm.hostname = "worker1"
#   end

#   config.vm.define "worker2" do |worker|
#     worker.vm.network "private_network", type: "dhcp"
#     worker.vm.hostname = "worker2"
#   end
# end



# Vagrant.configure("2") do |config|
#   config.vm.box = "generic/debian11"  # Debian 11 is Proxmox's base OS

#   config.vm.provider "virtualbox" do |vb|
#     vb.memory = "8192"  # Allocate 8GB RAM (adjust as needed)
#     vb.cpus = 4         # Allocate CPU cores
#     vb.customize ["modifyvm", :id, "--nested-hw-virt", "on"]  # Enable nested virtualization
#   end

#   config.vm.network "public_network", bridge: "en0: Wi-Fi (Wireless)"  # Bridge for external access

#   config.vm.provision "shell", inline: <<-SHELL
#     apt update -y
#     apt install -y wget
#     wget http://download.proxmox.com/iso/proxmox-ve_8.3-1.iso -O /tmp/proxmox.iso
#     echo "Proxmox ISO downloaded, ready for manual installation"
#   SHELL
# end


# Vagrant.configure("2") do |config|
#   config.vm.box = "ubuntu/focal64"  # Ubuntu 20.04 as a base OS (change if needed)

#   config.vm.provider "virtualbox" do |vb|
#     vb.memory = "8192"  # Allocate 8GB RAM (adjust as needed)
#     vb.cpus = 4         # Allocate CPU cores
#     vb.customize ["modifyvm", :id, "--nested-hw-virt", "on"]  # Enable nested virtualization
#   end

#   config.vm.network "public_network", bridge: "enp3s0"  # Use correct network interface (check with "ip a" or "ifconfig")

#   config.vm.provision "shell", inline: <<-SHELL
#     apt update -y
#     apt install -y wget
#     wget http://download.proxmox.com/iso/proxmox-ve_8.3-1.iso -O /tmp/proxmox.iso
#     mkdir /mnt/proxmox
#     mount -o loop /tmp/proxmox.iso /mnt/proxmox
#     cd /mnt/proxmox
#     dpkg -i proxmox-ve_*.deb
#     apt update
#     apt install -f
#     echo "Proxmox installation complete, ready to configure"
#   SHELL
# end


Vagrant.configure("2") do |config|
  # Use a Debian base box
  config.vm.box = "debian/bullseye64"  # Debian 11 as the base OS

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "8192"  # Allocate 8GB RAM (adjust as needed)
    vb.cpus = 4         # Allocate CPU cores
    vb.customize ["modifyvm", :id, "--nested-hw-virt", "on"]  # Enable nested virtualization
  end

  # Set up public network (adjust interface name based on your host machine)
  config.vm.network "public_network", bridge: "enp3s0"  # Use correct network interface (check with "ip a" or "ifconfig")

  config.vm.provision "shell", inline: <<-SHELL
    # Update the system
    apt update -y
    apt upgrade -y

    # Install prerequisites
    apt install -y wget gnupg2

    # Add Proxmox repository and key
    echo "deb http://download.proxmox.com/debian/pve bullseye pve-no-subscription" | tee /etc/apt/sources.list.d/proxmox.list
    wget -qO - http://download.proxmox.com/debian/proxmox-ve-release-8.3-1.gpg | tee /etc/apt/trusted.gpg.d/proxmox.asc

    # Install Proxmox VE
    apt update
    apt install -y proxmox-ve postfix open-iscsi

    # Configure Proxmox
    systemctl enable pve-cluster
    systemctl enable pvedaemon
    systemctl enable pve-manager
    systemctl enable pvestatd
    systemctl enable pveproxy

    # Reboot the VM for changes to take effect
    reboot
  SHELL
end
