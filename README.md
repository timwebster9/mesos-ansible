# Ansible Mesos
Provision Mesos with Ansible

Based on https://github.com/AnsibleShipyard/ansible-mesos and updated for RHEL 7.3

## Requirements
The following must be installed on your host:
* VirtualBox
* Vagrant
* Ansible

If you are running from Windows or don't want to install Ansible, you can change to use [Ansible local provisioner](https://www.vagrantup.com/docs/provisioning/ansible_local.html). e.g. in the Vagrantfile:

    slave.vm.provision "ansible_local" do |ansible|
    
    
__NOTE:__ The scripts in the `scripts` directory are only required for local Vagrant testing, and are not used or required by the Ansible role.  

## Usage

### Vagrant

This can run against a Vagrant box for testing.  The box provided is RHEL 7.3 and needs to be registered using your [Red Hat Developer Program](https://developers.redhat.com/register) subscription credentials.

To enable registration, create a file called `register.sh` in the `scripts` directory of this project with the following content (substituting your credentials):

    subscription-manager register --username <username> --password <password> --auto-attach

To run with Vagrant:

`Vagrantfile.template` defines an entire High-availablity Mesos cluster consisting of:

* 3 Zookeeper servers
* 3 Mesos masters
* 6 Mesos slaves (3 running on the master, 3 stand-alone)

Due to what I think is a bug in Vagrant, I had to provision these individually.  Sometimes Vagrant hangs while bringing up the network interfaces.

### Mesos Masters
Provision the masters first:
 
* Copy the box configuration for `mesos1` VM into `Vagrantfile`.
* In `playbook-master-slave.yml` specify the `mesos_ip` and `zookeeper_id`:
* `mesos_ip` must match the IP of the VM in your Vagrantfile
* `zookeeper_id` must be unique for each master
* Also make sure that the the IP addresses you use match the `zk_host` entries.
* Provision the VM with `vagrant up`
* Repeat this process for 2 more masters (mesos2 and mesos3).

### Mesos Slaves

* Copy one of the slave VM config items into Vagrantfile
* In `playbook-slave.yml` specify the `mesos_ip`
* Make sure that the the IP addresses you use match the `zk_host` entries.
* Provision the VM with `vagrant up`
* Repeat with as many slaves as you like

### Ansible

TODO
    