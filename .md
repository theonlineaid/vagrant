### **Creating Multiple VMs with Vagrant Without Manual Setup**

Vagrant is a powerful tool that automates the process of managing virtual machine environments, making it easier to create and configure multiple VMs without the need for manual setups. Here's how you can create and manage multiple virtual machines (VMs) in a seamless and automated way.

---

#### **Step 1: Install Vagrant**

To get started, you need to install Vagrant and configure your system to use it.

1. **Install HashiCorp GPG Key:**

   ```bash
   wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
   ```

2. **Add the Vagrant Repository:**

   ```bash
   echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
   ```

3. **Update Packages and Install Vagrant:**

   ```bash
   sudo apt update && sudo apt install vagrant
   ```

4. **Verify Installation:**

   To ensure that Vagrant was installed successfully, run:

   ```bash
   vagrant version
   ```

---

#### **Step 2: Initialize the Vagrant Environment**

Once Vagrant is installed, create a new directory and initialize the environment:

```bash
vagrant init
```

This command creates a `Vagrantfile` that will define the configuration for your virtual machines.

---

#### **Step 3: Configure Multiple VMs in the `Vagrantfile`**

You can configure multiple VMs by editing the `Vagrantfile` to specify the desired number of VMs, network settings, and other configurations.

Here’s an example configuration for two VMs:

```ruby
Vagrant.configure("2") do |config|
  # Use Ubuntu Focal 64-bit as the base box
  config.vm.box = "ubuntu/focal64"

  # Define the first worker node
  config.vm.define "worker1" do |worker|
    worker.vm.network "private_network", type: "dhcp"
    worker.vm.hostname = "worker1"
  end

  # Define the second worker node
  config.vm.define "worker2" do |worker|
    worker.vm.network "private_network", type: "dhcp"
    worker.vm.hostname = "worker2"
  end
end
```

This configuration will create two VMs (`worker1` and `worker2`), each with a private network and a hostname.

---

#### **Step 4: Bring Up the VMs**

Once the `Vagrantfile` is set up, run the following command to bring up the VMs:

```bash
vagrant up
```

Vagrant will automatically download the necessary images, create the VMs, and configure them according to your `Vagrantfile` settings.

---

#### **Step 5: Access the VMs via SSH**

To access your VMs, use the `vagrant ssh` command for each worker node:

```bash
vagrant ssh worker1
```

Alternatively, if you want to access the VM using SSH configuration, you can get the SSH details with:

```bash
vagrant ssh-config
```

This will show the SSH configuration for each VM, including the port, hostname, and private key to use. For example:

```plaintext
Host worker1
  HostName 127.0.0.1
  User vagrant
  Port 2200
  IdentityFile /home/md-omor/Documents/vm/.vagrant/machines/worker1/virtualbox/private_key
  IdentitiesOnly yes
  LogLevel FATAL

Host worker2
  HostName 127.0.0.1
  User vagrant
  Port 2201
  IdentityFile /home/md-omor/Documents/vm/.vagrant/machines/worker2/virtualbox/private_key
  IdentitiesOnly yes
  LogLevel FATAL
```

You can SSH into the VMs using:

```bash
ssh -p 2200 vagrant@localhost   # For worker1
ssh -p 2201 vagrant@localhost   # For worker2
```

---

#### **Step 6: Check VM Status**

To check the status of the VMs, use the `vagrant status` command:

```bash
vagrant status
```

The output will show the state of each VM:

```plaintext
worker1                   running (virtualbox)
worker2                   running (virtualbox)
```

---

#### **Step 7: Shut Down the VMs**

To shut down the VMs, use the `vagrant halt` command:

```bash
vagrant halt
```

This will gracefully shut down all running VMs. You can also shut down a specific VM by specifying its name:

```bash
vagrant halt worker1
```

---

### **Conclusion**

Using Vagrant, you can easily create and manage multiple VMs without manual setup. By defining your configuration in the `Vagrantfile`, you can quickly spin up multiple environments, access them via SSH, and manage their state with simple commands. This approach is perfect for testing, development, and learning Kubernetes, DevOps practices, or any other application that requires isolated virtual environments.