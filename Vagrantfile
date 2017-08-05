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

#	config.vm.define "master" do |master|
#		master.vm.box = "timwebster9/rhel73"
#		master.vm.network "private_network", ip: "192.168.56.10"
#		master.vm.hostname = "master"
#
#		master.vm.provider "virtualbox" do |v|
#			  v.memory = 2048
#			  v.cpus = 2
#		end
#
#		# Workaround for possible Vagrant bug where host-only network interface doesn't come up
#		master.vm.provision "shell", path: "scripts/network.sh"
#
#		# disable firewall
#		master.vm.provision "shell", path: "scripts/firewall.sh"
#
#		# Activate RH subscription - change to use your credentials
#		master.vm.provision "shell", path: "scripts/register.sh"
#
#		# Add extra repos needed for Mesos dependencies
#		master.vm.provision "shell", inline: "subscription-manager repos --enable rhel-7-server-optional-rpms"
#
#		master.vm.provision "ansible" do |ansible|
#			ansible.verbose = "v"
#			ansible.playbook = "playbook-master.yml"
#		end
#	end
#
#	config.vm.define "slave" do |slave|
#		slave.vm.box = "timwebster9/rhel73"
#		slave.vm.network "private_network", ip: "192.168.56.11"
#		slave.vm.hostname = "slave"
#
#		slave.vm.provider "virtualbox" do |v|
#			  v.memory = 2048
#			  v.cpus = 2
#		end
#
#		# Workaround for possible Vagrant bug where host-only network interface doesn't come up
#		slave.vm.provision "shell", path: "scripts/network.sh"
#
#		# disable firewall
#		slave.vm.provision "shell", path: "scripts/firewall.sh"
#
#		# Activate RH subscription - change to use your credentials
#		slave.vm.provision "shell", path: "scripts/register.sh"
#
#		# Add extra repos needed for Mesos dependencies
#		slave.vm.provision "shell", inline: "subscription-manager repos --enable rhel-7-server-optional-rpms"
#		slave.vm.provision "shell", inline: "subscription-manager repos --enable=rhel-7-server-extras-rpms"
#
#		# Dodgy CentOS install of Docker just for testing
#		slave.vm.provision "shell", path: "scripts/install-docker.sh"
#
#		slave.vm.provision "ansible" do |ansible|
#			ansible.verbose = "v"
#			ansible.playbook = "playbook-slave.yml"
#		end
#	end

end
