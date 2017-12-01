# Prepares a newly created Solus 3 VM instance to be exported as a Vagrant box.
# 
# This is part 1 of 2 parts. For details on what the script does, see comments
# inside the files.
# 
# PLEASE NOTE that you must manually set which version of Guest Additions to
# install by modifying a variable at the top of part two.
# 
# ALSO PLEASE NOTE that this script needs superman powers. Run like so:
# 
#   sudo sh prepare_box_part1.sh 
# 
# For the VirtualBox Guest Additions to be properly installed, a reboot is
# required after installing the kernel headers and before attempting to run
# VirtualBox's installation script. If you don't reboot, then he will fail to
# build the headers . This is actually the only reason why we have two parts
# and not just one.
# 
# I THINK that maybe you could run both parts consecutively without a reboot and
# the Guest Additions would attempt to continue the installation after the first
# reboot, whenever that happens. BUT.. you would have to remember this seemingly
# pointless step to reboot for no purpose other than to shutdown again and
# package the box. If you don't, then the host machine's vbguest plugin (if this
# guy is present) will not detect the Guest Additions installation during the
# first "vagrant up" and thus proceed to install them on his own. See what I'm
# getting at? Keep it simple and keep it clean, reboot after part 1.
# 
# Last edit: 2017-11-27

eopkg update-repo
eopkg upgrade -y

# Authorize Vagrant's insecure public SSH key
mkdir /home/vagrant/.ssh/
chmod 700 /home/vagrant/.ssh/
wget https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub -O /home/vagrant/.ssh/authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

# Set root password to "vagrant"
echo root:vagrant | chpasswd

# Passwordless sudo
echo $'\nvagrant ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# Install an SSH server
eopkg install openssh-server
systemctl enable sshd

# Install VirtualBox Guest Additions dependencies
eopkg install linux-current-headers
eopkg install -y gcc make autoconf binutils xorg-server-devel



echo $'\nYou\'re almost there. Reboot and run part two!'