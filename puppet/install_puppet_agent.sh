#!/bin/bash
pkg=puppetlabs-release-precise.deb; wget https://apt.puppetlabs.com/$pkg ; dpkg -i $pkg; apt-get update; apt-get install puppet; rm $pkg


