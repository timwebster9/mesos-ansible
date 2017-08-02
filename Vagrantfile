# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

	config.vm.define "slave" do |slave|
		slave.vm.box = "timwebster9/rhel73"
		slave.vm.network "private_network", ip: "192.168.56.10"
		slave.vm.hostname = "slave"

		slave.vm.provider "virtualbox" do |v|
			  v.memory = 2048
			  v.cpus = 2
		end

		# Workaround for possible Vagrant bug where host-only network interface doesn't come up
		slave.vm.provision "shell", inline: "systemctl restart network"

		# Activate RH subscription - change to use your credentials
		slave.vm.provision "shell", inline: "subscription-manager register --username timwebster --password webs5358 --auto-attach"

		# Add extra repos needed for Mesos dependencies
		slave.vm.provision "shell", inline: "subscription-manager repos --enable rhel-7-server-optional-rpms"

		slave.vm.provision "ansible_local" do |ansible|
			ansible.verbose = "v"
			ansible.playbook = "playbook.yml"
		end
	end

end
