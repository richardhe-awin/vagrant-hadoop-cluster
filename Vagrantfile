# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  # Tell virtualbox to use the host name as the dns resolver.
  # This would solve the slow internet issue in the VMs
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  # List of worker nodes to setup
  worker_nodes = [:node1, :node2]

  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  config.ssh.forward_agent = true

  # enable vagrant-hostmanager
  config.hostmanager.enabled = false
  config.hostmanager.manage_host = true
  config.hostmanager.include_offline = true
  config.hostmanager.ignore_private_ip = false

  # CLUSTER CONFIGURATION

  config.vm.define :master do |node|
    node.vm.provider :virtualbox do |v|
      v.name = "hadoop-master"
      v.customize ["modifyvm", :id, "--memory", "6144"]
    end
    node.vm.network :private_network, ip: "192.168.33.11"
    node.vm.hostname = "hadoop-master"
    node.vm.provision :shell, path: "provision_hosts.sh"
    node.vm.provision :hostmanager
    node.vm.provision :shell, path: "provision_master.sh"
  end

  worker_nodes.each_with_index do |node, index|
    config.vm.define node do |n|
      n.vm.provider :virtualbox do |v|
        v.name = "hadoop-#{node.to_s}"
        v.customize ["modifyvm", :id, "--memory", "2048"]
      end
      n.vm.network :private_network, ip: "192.168.33.#{12 + index}"
      n.vm.hostname = "hadoop-#{node.to_s}"
      n.vm.provision :shell, path: "provision_hosts.sh"
      n.vm.provision :hostmanager
    end
  end
end
