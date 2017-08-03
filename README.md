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

    vagrant up
    
To verify that the provisioning was successful, log into the slave box:

    vagrant ssh slave
    
and check the mesos slave service log:

    sudo journalctl -u mesos-slave
    
you should see something like the following at the end (hit the 'end' key to scroll to the bottom):

    Aug 03 08:47:34 slave mesos-slave[5970]: I0803 08:47:34.679967  5976 slave.cpp:915] New master detected at master@192.168.56.10:5050
    Aug 03 08:47:34 slave mesos-slave[5970]: I0803 08:47:34.680043  5976 slave.cpp:936] No credentials provided. Attempting to register without authentication
    Aug 03 08:47:34 slave mesos-slave[5970]: I0803 08:47:34.680063  5976 slave.cpp:947] Detecting new master
    Aug 03 08:47:35 slave mesos-slave[5970]: I0803 08:47:35.138576  5976 slave.cpp:1115] Registered with master master@192.168.56.10:5050; given agent ID 69577748-d460-47d0-9350-3b0995fe97db-S0
    Aug 03 08:47:35 slave mesos-slave[5970]: I0803 08:47:35.139562  5976 slave.cpp:1175] Forwarding total oversubscribed resources {}
    Aug 03 08:47:35 slave mesos-slave[5970]: I0803 08:47:35.139691  5976 status_update_manager.cpp:184] Resuming sending status updates
    Aug 03 08:48:34 slave mesos-slave[5970]: I0803 08:48:34.604652  5976 slave.cpp:5044] Current disk usage 10.97%. Max allowed age: 5.532068843782338days
    
### Ansible

TODO
    