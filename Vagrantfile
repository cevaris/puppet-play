# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # # Every Vagrant virtual environment requires a box to build off of.
  # config.vm.hostname = "memcached"
  # config.vm.box = "trusty"
  # config.vm.box_url = 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'

  
  # config.vm.provision "puppet" do |puppet|
  #   puppet.manifests_path = "puppet/manifests/"
  #   puppet.manifest_file = "rabbitmq.pp"
  #   puppet.module_path = "puppet/modules/"
  #   puppet.options = "--verbose --debug"
  # end

  # config.hostmanager.enabled = true
  # config.hostmanager.manage_host = true
  # config.hostmanager.ignore_private_ip = false
  # config.hostmanager.include_offline = true


  config.vm.box = "trusty"
  config.vm.box_url = 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'

  # config.hostmanager.enabled = true
  # config.hostmanager.manage_host = true
  # config.hostmanager.ignore_private_ip = false
  # config.hostmanager.include_offline = true

  
  config.vm.define "rabbit1" do |node|
    node.vm.hostname = "rabbit1"
    node.vm.network "private_network", ip: "192.168.50.11"
    node.hostmanager.aliases = %w(rabbit1.local rabbit1)

    # node.hostmanager.enabled = true
    # node.hostmanager.manage_host = true
    # node.hostmanager.ignore_private_ip = false
    # node.hostmanager.include_offline = true


    node.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "puppet/manifests/"
      puppet.manifest_file = "rabbitmq.pp"
      puppet.module_path = "puppet/modules/"
      puppet.options = "--verbose --debug"
    end
  end

  config.vm.define "rabbit2" do |node|
    node.vm.hostname = "rabbit2"
    node.vm.network "private_network", ip: "192.168.50.12"
    node.hostmanager.aliases = %w(rabbit2.local rabbit2)

    # node.hostmanager.enabled = true
    # node.hostmanager.manage_host = true
    # node.hostmanager.ignore_private_ip = false
    # node.hostmanager.include_offline = true

    node.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "puppet/manifests/"
      puppet.manifest_file = "rabbitmq.pp"
      puppet.module_path = "puppet/modules/"
      puppet.options = "--verbose --debug"
    end
  end 

  

end
