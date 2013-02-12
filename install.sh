#!/bin/bash
# super simple script for making a node a vagrant instance
apt-get install -y puppet
apt-get install -y git-core
git clone https://github.com/smarchive/puppet-virtualbox /etc/puppet/modules/virtualbox
git clone https://github.com/puppetlabs/puppetlabs-stdlib /etc/puppet/modules/stdlib
git clone https://github.com/puppetlabs/puppetlabs-apt /etc/puppet/modules/apt
puppet apply -e 'include vagrant'
