VBOX_VERSION=5.2.2

# Install VirtualBox Guest Additions
wget http://download.virtualbox.org/virtualbox/$VBOX_VERSION/VBoxGuestAdditions_$VBOX_VERSION.iso
mount -o loop,ro VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
/mnt/VBoxLinuxAdditions.run
umount /mnt
rm VBoxGuestAdditions_$VBOX_VERSION.iso
unset VBOX_VERSION

# Delete temporary- and cached files
eopkg delete-cache
shopt -s dotglob
rm -rf /home/vagrant/.cache/*
rm -rf /root/.cache/*
rm -rf /var/cache/*
rm -rf /var/tmp/*
rm -rf /tmp/*

# Clear recent bash history
cat /dev/null > /home/vagrant/.bash_history

# Compact drive
# ..must follow by a command on your host machine, something like:
#     VBoxManage modifymedium compact "C:\Users\Martin\VirtualBox VMs\solus-3-budgie\solus-3-budgie.vdi"
# 
# PRUNED. I found that using a VMDK drive right from the start when creating the
# VM versus using a VDI drive which is converted to VMDK when exporting the VM,
# is the most disk efficient; comparing the end result of a packaged Vagrant
# box. And VirtualBox can not compact VMDK so there's just no point in running
# this magic code snippet.
# 
# Also - just for the record - my experience (confirmed by a few online sources)
# showed that even with a compacted VDI drive, running this magic snippet has no
# impact on the exported disk space?
#dd if=/dev/zero of=/tmp/bigemptyfile
#sync
#sleep 3
#sync
#rm /tmp/bigemptyfile
#sync



echo 'All done. Shutdown and package the box!'
history -c    # <-- clear this sessions's bash history