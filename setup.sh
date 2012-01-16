# Consider this an overview of the steps rather than an actual script to run,
# at least for the moment--there are some issues with running it straight
# that I haven't had time to work out yet.
echo This script is a process to follow, not a script to run, as there are bugs that break it for now.  Open it and follow the steps.
exit

# Assumptions:
# 1.  The rails-base.box file is located in your $HOME directory
# 2.  git and VirtualBox have already been installed independently
# 3.  Github access has been configured (with shell access)
# Future Work:
# 1.  Parameterize paths
#   a.  Starting directory
#   b.  Code location (devotion-cms)
#   c.  Code location (helper apps (rbenv (might be hard/impossible), ruby-build))
#   d.  Location of rails-base.box
# 2.  Parameterize Ruby version
# 3.  Github-specific key gen?  (probably overkill and unnecessary)

# start at home
cd $HOME

# pull down source -- assumes you have github access already
git clone git@github.com:whitecl/devotion-cms.git

# mv rails-base.box file
mv rails-base.box devotion-cms/

# we'll come back here later--keep a record of it for easy returns
cd devotion-cms

# install rbenv
pushd ~
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
# bounce shell - simply sourcing the .bash_profile should work, but I haven't really tried it
exec $SHELL

# install ruby-install rbenv command
git clone git://github.com/sstephenson/ruby-build.git
cd ruby-build
./install.sh

# install Ruby 1.9.3-p0
rbenv install 1.9.3-p0

# rehash rbenv
rbenv rehash

# install vagrant
gem install vagrant

# rehash rbenv -- just in case
rbenv rehash

# return to source
popd

# init virtual machine
vagrant box add rails-base rails-base.box
vagrant init rails-base

# run startup script
./startup.sh
