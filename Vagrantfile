# -*- mode: ruby -*-
# vi: set ft=ruby :

# Include this file when packaging the box.

Vagrant.configure('2') do |config|
  # Partial remedy for missing Solus support
  # See: https://github.com/hashicorp/vagrant/issues/9225
  config.vm.guest = :linux
  
  config.vm.provider 'virtualbox' do |box|
     box.gui = true
  end
end