# -*- mode: ruby -*-
# vi: set ft=ruby :

# Include this file when packaging the box.

Vagrant.configure('2') do |cfg|
  cfg.vm.define 'solus-3-budgie'
  # TODO: Add Vagrant's issue tracker.
  cfg.vm.guest = :linux
  
  cfg.vm.provider 'virtualbox' do |box|
     box.gui = true
  end
end