SUN Developer VM
================

This sets up a LAMP stack in a VM for SUN developers. It is based closely on [vagrant-lamp](https://github.com/r8/vagrant-lamp)
but I removed a lot of stuff we don't need and customized it slightly for our use.

SUN = (Systems United Navy)[http://www.systemsunitednavy.com/], a premiere (Star Citizen)[https://robertsspaceindustries.com/] community.


Installation
------------

1. Install [VirtualBox](http://www.virtualbox.org/)

2. Install [vagrant](http://vagrantup.com/)

3. Install Omnibus
```
$ vagrant plugin install vagrant-omnibus
```

4. Clone this repository and update its submodules
```
$ git clone https://github.com/sc-xist/vagrant-sun
$ cd vagrant-sun
$ git submodule update
```

5. Add this line to your /etc/hosts:
```
192.168.133.101 sun-db.dev www.sun-db.dev
```


Launch the vagrant-sun VM
-------------------------

```
$ cd vagrant-sun
$ vagrant up
$ vagrant ssh
```

Here you cd to the directory where you cloned this repository.
Therein lie the vagrant configs that allow you to start up the VM
and ssh to it.


Testing out Web sites
---------------------

Open a browser on your host machine, go to [http://sun-db.dev/](http://sun-db.dev/)


Finding out more
================

This VM uses the stock [chef/centos-6.5](https://vagrantcloud.com/chef/centos-6.5) from [Vagrant Cloud](https://vagrantcloud.com/)
and then adds some chef cookbooks courtesy of [OpsCode](http://community.opscode.com/).

Those cookbooks are then slightly modified to apply [SUN-specific changes](https://github.com/sc-xist/vagrant-sun/tree/master/chef/cookbooks/sun-db).
