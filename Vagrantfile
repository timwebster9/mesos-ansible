# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

	config.vm.define "mesos1" do |mesos1|
		mesos1.vm.box = "timwebster9/rhel73"
		mesos1.vm.network "private_network", ip: "192.168.56.10"
		mesos1.vm.hostname = "mesos1"

		mesos1.vm.provider "virtualbox" do |v|
			  v.memory = 2048
			  v.cpus = 1
		end

		# Workaround for possible Vagrant bug where host-only network interface doesn't come up
		mesos1.vm.provision "shell", path: "scripts/network.sh"

		# disable firewall
		mesos1.vm.provision "shell", path: "scripts/firewall.sh"

		# Activate RH subscription - change to use your credentials
		mesos1.vm.provision "shell", path: "scripts/register.sh"

		# Add extra repos needed for Mesos dependencies
		mesos1.vm.provision "shell", inline: "subscription-manager repos --enable rhel-7-server-optional-rpms"
		mesos1.vm.provision "shell", inline: "subscription-manager repos --enable=rhel-7-server-extras-rpms"

		# Dodgy CentOS install of Docker just for testing
		mesos1.vm.provision "shell", path: "scripts/install-docker.sh"

		mesos1.vm.provision "ansible" do |ansible|
			ansible.verbose = "v"
			ansible.playbook = "playbook-master-slave.yml"
		end
	end

end
