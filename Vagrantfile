# -*- mode: ruby -*-
# vi: set ft=ruby :

# Include this file when packaging the box.

Vagrant.configure('2') do |cfg|
  # Partial remedy for missing Solus support
  # See: https://github.com/hashicorp/vagrant/issues/9225
  cfg.vm.guest = :linux
  
  cfg.vm.provider 'virtualbox' do |box|
     box.gui = true
  end
end