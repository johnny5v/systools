#!/bin/bash
wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb 
sudo dpkg -i uppetlabs-release-precise.deb
sudo apt-get update
sudo apt-get install puppetmaster


