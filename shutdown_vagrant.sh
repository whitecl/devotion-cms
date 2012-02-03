# turn off the VM
vagrant halt

# make sure it's dead
# Note:  May throw error as described @
#  https://github.com/mitchellh/virtualbox/issues/76
#  Haven't tried the patch yet
#
echo "WARNING:  this will nuke your virtual disk, so you'll have to re-init your db, gems, and such if you use it."
read "Destroy Vagrant Disk? [y/N] " DESTROY_DISK
if [ "$DESTROY_DISK" == "y" ]
then
	vagrant destroy
fi
