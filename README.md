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

### install and run vagrant

Install vagrant and then

    $ vagrant up

When vagrant is done, you could got to http://11.11.11.11 and see php info.

### git submodules
    
    $ git submodule init && git submodule update

