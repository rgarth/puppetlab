#!/bin/bash
set -e

# set the hostname
# The hostname would normally be set by dhcp,
# this is really only specifc to this example
hostnamectl set-hostname host1.localdomain

# grab puppet repo
yum update -y
yum -y localinstall http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum localinstall -y https://yum.puppet.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum install -y puppet-agent ruby

# install r10k
echo | gem install r10k

# create symlink for environment
[ -e /etc/puppetlabs/code/environments/lab ] ||
  ln -s /vagrant/puppet/ /etc/puppetlabs/code/environments/lab

# install required puppet modules
cd /vagrant/puppet; /usr/local/bin/r10k puppetfile install

# Initial puppet run
/opt/puppetlabs/bin/puppet apply /vagrant/puppet/manifests/site.pp --environment lab

exit 0

# in here you can add whatever you feel you need to get this host up off the ground.
