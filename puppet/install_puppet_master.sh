#!/bin/bash
pkg=puppetlabs-release-precise.deb
wget https://apt.puppetlabs.com/$pkg 
sudo dpkg -i $pkg
sudo apt-get update
sudo apt-get install puppetmaster
rm $pkg


