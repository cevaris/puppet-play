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

  config.vm.box = "trusty"
  config.vm.box_url = 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'

  config.vm.define "rabbit1" do |rabbit1|
    # rabbit1.vm.hostname = "rabbit1"
    rabbit1.vm.network "private_network", ip: "192.168.50.11"

    config.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "puppet/manifests/"
      puppet.manifest_file = "rabbitmq.pp"
      puppet.module_path = "puppet/modules/"
      puppet.options = "--verbose --debug"
    end
    

  end

  config.vm.define "rabbit2" do |rabbit2|
    # rabbit2.vm.hostname = "rabbit2"
    rabbit2.vm.network "private_network", ip: "192.168.50.12"

    config.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "puppet/manifests/"
      puppet.manifest_file = "rabbitmq.pp"
      puppet.module_path = "puppet/modules/"
      puppet.options = "--verbose --debug"
    end
  end 

end
