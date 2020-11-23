# -*- mode: ruby -*-
# vi: set ft=ruby :

#Array of hashes for all VMs that should be created
vms=[
{
  :hostname => "Nomad-Agent1",
  :ip => "192.168.100.11",
  :box => "centos/7",
  :ram => 2048,
  :script => "scripts/client1.sh"
},
{
  :hostname => "Nomad-Agent2",
  :ip => "192.168.100.12",
  :box => "centos/7",
  :ram => 2048,
  :script => "scripts/client2.sh"
},
{
  :hostname => "Nomad-Server1",
  :ip => "192.168.100.10",
  :box => "centos/7",
  :ram => 2048,
  :script => "scripts/server.sh"
}
]


VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  #loop for making all the VMs
  vms.each do |machine|
    config.vm.define machine[:hostname] do |node|
    
        node.vm.box = machine[:box]
        node.vm.hostname = machine[:hostname]
        node.vm.network "private_network", ip: machine[:ip]
        node.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--memory", machine[:ram]]
        end
        node.vm.provision "shell", path: "scripts/init.sh"
        node.vm.provision "shell", path: machine[:script]
     end
   end 
end