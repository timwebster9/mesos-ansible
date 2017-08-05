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
			ansible.playbook = "playbook-mesos1.yml"
		end
	end

	config.vm.define "mesos2" do |mesos2|
		mesos2.vm.box = "timwebster9/rhel73"
		mesos2.vm.network "private_network", ip: "192.168.56.11"
		mesos2.vm.hostname = "mesos2"

		mesos2.vm.provider "virtualbox" do |v|
			  v.memory = 2048
			  v.cpus = 1
		end

		# Workaround for possible Vagrant bug where host-only network interface doesn't come up
		mesos2.vm.provision "shell", path: "scripts/network.sh"

		# disable firewall
		mesos2.vm.provision "shell", path: "scripts/firewall.sh"

		# Activate RH subscription - change to use your credentials
		mesos2.vm.provision "shell", path: "scripts/register.sh"

		# Add extra repos needed for Mesos dependencies
		mesos2.vm.provision "shell", inline: "subscription-manager repos --enable rhel-7-server-optional-rpms"
		mesos2.vm.provision "shell", inline: "subscription-manager repos --enable=rhel-7-server-extras-rpms"

		# Dodgy CentOS install of Docker just for testing
		mesos2.vm.provision "shell", path: "scripts/install-docker.sh"

		mesos2.vm.provision "ansible" do |ansible|
			ansible.verbose = "v"
			ansible.playbook = "playbook-mesos2.yml"
		end
	end

	config.vm.define "mesos3" do |mesos3|
		mesos3.vm.box = "timwebster9/rhel73"
		mesos3.vm.network "private_network", ip: "192.168.56.12"
		mesos3.vm.hostname = "mesos3"

		mesos3.vm.provider "virtualbox" do |v|
			  v.memory = 2048
			  v.cpus = 1
		end

		# Workaround for possible Vagrant bug where host-only network interface doesn't come up
		mesos3.vm.provision "shell", path: "scripts/network.sh"

		# disable firewall
		mesos3.vm.provision "shell", path: "scripts/firewall.sh"

		# Activate RH subscription - change to use your credentials
		mesos3.vm.provision "shell", path: "scripts/register.sh"

		# Add extra repos needed for Mesos dependencies
		mesos3.vm.provision "shell", inline: "subscription-manager repos --enable rhel-7-server-optional-rpms"
		mesos3.vm.provision "shell", inline: "subscription-manager repos --enable=rhel-7-server-extras-rpms"

		# Dodgy CentOS install of Docker just for testing
		mesos3.vm.provision "shell", path: "scripts/install-docker.sh"

		mesos3.vm.provision "ansible" do |ansible|
			ansible.verbose = "v"
			ansible.playbook = "playbook-mesos2.yml"
		end
	end

end
