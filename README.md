## Introduction

`devotion-cms` is a Ruby on Rails application designed to manage and display
seasonal devotions.  Simply put, it allows you to define and schedule a series
of devotions that are released over a period of days or weeks (a "season").
These devotions can include plain text, YouTube videos, Soundcloud sounds, and
images, as well as links to any other file type.  (Full support for other media
types is in the works.)

While designed around the unique quirks of the Lenten season, `devotion-cms` can
accommadate a wide range of season constraints.

You can see a live example at the [40days](http://exoworship.com/) site, a
series of Lenten devotions produced by the community of [Exodus Church of
Bloomington](http://exodusbloomington.org).

## General Setup

Assumes we're running Ubuntu 11.10.

Before compiling ruby:

    sudo apt-get install git-core curl mysql-server mysql-client \
                         build-essential zlib1g-dev libmysql-ruby \
                         libmysqlclient-dev libopenssl-ruby libssl-dev \
                         libopenssl-ruby libreadline-dev libxml2 libxml2-dev \
                         libxslt1-dev redis-server

For other dependencies:

    sudo apt-get install imagemagick --fix-missing

### Database

Copy `config/database-example.yml` to `config/database.yml`

    rake db:create
    rake db:migrate

### Timezones

Time math relies on the timezone set in `application.rb` matching your system's
time zone.  40days defaults to `US/Eastern`.

In Ubuntu Lucid:

    sudo dpkg-reconfigure tzdata

## Dev Environment Web Server

After running `bundle install` and completing db migrations and seeds:

    cp Procfile.example-dev Procfile
    bundle exec foreman start

## Staging/Production Modifications
### Firewall

In order to run `thin` in the user space, we're doing the following to  `iptables`:

    sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
    sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
    sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
    sudo iptables -A INPUT -p tcp --dport 3000 -j ACCEPT
    sudo iptables -A INPUT -i lo -j ACCEPT
    sudo iptables -A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT
    sudo iptables -A INPUT -m limit --limit 5/min -j LOG --log-prefix "iptables denied: " --log-level 7
    sudo iptables -A INPUT -j DROP
    sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 3000

Config the system to save and restore `iptables` rules on startup/shutdown.

    sudo sh -c "iptables-save -c > /etc/iptables.rules"

    sudo vim /etc/network/interfaces

At the end of each section:

    pre-up iptables-restore < /etc/iptables.rules
    post-down iptables-save -c > /etc/iptables.rules

## Staging/Production Web Server

1. Configure `rbenv`, `ruby 1.9.2-p290` and `40days` under the `fortydays` user.

2. In Ubuntu, make sure the `rbenv` start scripts (see `rbenv` docs) are added to
`.profile`
    - Adding them to `.bashrc` will cause the exported upstart scripts to not be able
      to use `rbenv`.

3. Copy `Procfile.example` to `Procfile`.

        bundle install
        bundle exec foreman export upstart /tmp/upstart -a fortydays -u fortydays
        sudo cp /tmp/upstart/* /etc/init

        sudo vi /etc/init/fortydays.conf

4. Add this to the top to enable start on server reboot:

        start on runlevel [2345]

5. Now you can use magic start/stop commands.

        sudo start fortydays
        sudo restart fortydays
        sudo stop fortydays

    Note: start/restart takes > 60 seconds, so may be a good low-traffic time of day thing to do.

References:

-  [Introducing Foreman](http://blog.daviddollar.org/2011/05/06/introducing-foreman.html), by David Dollar
-  [Managing and monitoring your Ruby application with Foreman and Upstart](http://michaelvanrooijen.com/articles/2011/06/08-managing-and-monitoring-your-ruby-application-with-foreman-and-upstart/), by Michael van Rooijen

### Administration

Swap `staging` and `production` in these commands as needed.

Start/stop web server & worker process

    sudo start fortydays
    sudo stop fortydays

Updating code & db:

    # Log in as fortydays
    ssh fortydays@exoworship.com

    cd fortydays
    git pull
    bundle install
    RAILS_ENV=production bundle exec rake db:migrate
    RAILS_ENV=production bundle exec rake assets:precompile
    sudo restart fortydays
