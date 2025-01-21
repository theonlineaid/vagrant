Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"

  config.vm.define "worker1" do |worker|
    worker.vm.network "private_network", type: "dhcp"
    worker.vm.hostname = "worker1"
  end

  config.vm.define "worker2" do |worker|
    worker.vm.network "private_network", type: "dhcp"
    worker.vm.hostname = "worker2"
  end
end
