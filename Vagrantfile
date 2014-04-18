# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    # All Vagrant configuration is done here. The most common configuration
    # options are documented and commented below. For a complete reference,
    # please see the online documentation at vagrantup.com.

    # Every Vagrant virtual environment requires a box to build off of.
    config.vm.box = "chef/centos-6.5"
    config.vm.hostname = "dev#{rand(01..99)}.sun.vagrant.vm"

    config.vm.provider "virtualbox" do |v|
        v.name = "vagrant-sun-db"
        # 1 GB RAM limit
        v.memory = 1024
        # use no more than 2 cores
        v.cpus = 2
    end

    # Use vagrant-omnibus to install chef client
    config.omnibus.chef_version = :latest

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    config.vm.network "private_network", ip: "192.168.133.101"

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    config.vm.synced_folder ".", "/vagrant"

    config.vm.provision :chef_solo do |chef|

        chef.node_name = "sun-dev"

        chef.custom_config_path = "Vagrantfile.chef"

        chef.cookbooks_path = ["chef/opscode-cookbooks", "chef/cookbooks"]
        chef.data_bags_path = "data_bags"

        chef.add_recipe "sun-db"

    end

end
