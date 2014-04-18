SUN Developer VM
================

This sets up a LAMP stack in a VM for SUN developers. It is based closely on [vagrant-lamp](https://github.com/r8/vagrant-lamp)
but I removed a lot of stuff we don't need and customized it slightly for our use.

SUN = [Systems United Navy](http://www.systemsunitednavy.com/), a premiere [Star Citizen](https://robertsspaceindustries.com/) community.


Installation
------------

* Install [VirtualBox](http://www.virtualbox.org/)
* Install [Vagrant](http://vagrantup.com/)
* Install Omnibus
```
$ vagrant plugin install vagrant-omnibus
```
* Clone this repository and update its submodules
```
$ git clone https://github.com/sc-xist/vagrant-sun
$ cd vagrant-sun
$ git submodule update
```
* Add this line to your /etc/hosts:
```
192.168.133.101 sun-db.dev www.sun-db.dev
```


Launch the vagrant-sun VM
-------------------------

To launch the vagrant-sun VM, cd to the directory where you cloned this repository
and then type `vagrant up`.

The first time you run `vagrant up` it will take a while, it's configuring your VM
from a base OS install.  Subsequent times it will boot very fast.

To get onto your machine, type `vagrant ssh`.  You will have root access on the VM
if you need it by running `sudo bash`.

```
$ cd vagrant-sun
$ vagrant up
$ vagrant ssh
```


Testing out Web sites
---------------------

Open a browser on your host machine, go to [http://sun-db.dev/](http://sun-db.dev/)


Find out more
=============

This VM uses the stock [chef/centos-6.5](https://vagrantcloud.com/chef/centos-6.5) from [Vagrant Cloud](https://vagrantcloud.com/)
and then adds some chef cookbooks courtesy of [OpsCode](http://community.opscode.com/).

Those cookbooks are then slightly modified to apply [SUN-specific changes](https://github.com/sc-xist/vagrant-sun/tree/master/chef/cookbooks/sun-db).
