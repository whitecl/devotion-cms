# turn off the VM
vagrant halt

# make sure it's dead
# Note:  May throw error as described @
#  https://github.com/mitchellh/virtualbox/issues/76
#  Haven't tried the patch yet
vagrant destroy
