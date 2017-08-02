# Ansible Mesos
Provision Mesos with Ansible

Based on https://github.com/AnsibleShipyard/ansible-mesos and updated for RHEL 7.3

## Usage
This can run against a Vagrant box for testing.  The box provided is RHEL 7.3 and needs to be registered using your Red Hat Developer Program subscription credentials.

To enable registration, create a file call 'register.sh' in the root directory of this project with the following content (substituting your credentials):

    subscription-manager register --username <username> --password <password> --auto-attach

To run with Vagrant:

    vagrant up
    