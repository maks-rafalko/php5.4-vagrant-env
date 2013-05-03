# Chef solo PHP 5.4 environment

## Description

Chef solo config files to install a php 5.4 environment that can be used with vagrant.

## Includes

* Ubuntu Precise 64
* php 5.4
* apache
* mysql
* sqlite
* git
* ntp
* vim
* ntp
* xdebug
* memcached
* composer
* virtual host setup

## Installation

### Install and run vagrant

Install vagrant and then

    $ vagrant up

When vagrant is done, you could go to http://11.11.11.11 and see php info.

To SSH in to VM, just do

    $ vagrant ssh

Default application name is `vm-app`. Default application path is `/var/www/vm-app`.

To run your application from `host` machine in your browser, just add ServerName (default is `vm-app`) to your `hosts` file.

With Ubuntu:

    $ sudo vim /etc/hosts
    $ ... add new line: 11.11.11.11 vm-app
    $ ... save

Then you could run your application on `guest` VM from `host` maching from browser: http://vm-app/

### git submodules
    
    $ git submodule init && git submodule update

