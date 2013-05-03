# Chef solo PHP 5.4 environment

## Description

Chef solo config files to install a php 5.4 environment that can be used with Vagrant.

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

### Install and run Vagrant

Install Vagrant and then

    $ vagrant up

When Vagrant is done, you could go to http://11.11.11.11 and see php info.

To SSH in to VM, just do

    $ vagrant ssh

Default application name is `vm-app`. Default application path is `/var/www/vm-app`.

To run your application from `host` machine in your browser, just add the ServerName (default is `vm-app`) to your `hosts` file.

With Ubuntu:

    $ sudo vim /etc/hosts
    $ ... add new line: 11.11.11.11 vm-app
    $ ... save

Then you could run your application on `guest` VM from `host` machine using browser: [http://vm-app/](http://vm-app/)

### Custom VirtualHost and Application

You can overwrite default VirtualHost and application path (as well as DB name and `server_email` values):

Open `Vagrantfile` and modify Ruby Hash:

```ruby
chef.json = {
	"app" => {
		"path" => "/var/www/cool-another-app",
		"server_name" => "cool-another-app",
		"server_email" => "cool@another-app.com",
		"database" => "cool_another_app_db"
	},
	"mysql" => {
		"server_root_password" => "%your_path0%",			
		"server_repl_password" => "%your_path1%",
		"server_debian_password" => "%your_path2%"
	}
}
```

### git submodules
    
    $ git submodule init && git submodule update

### FYI

Please don't forget that VM uses Shared Folders, so each update of any file in `./www` foler will be immediately synced with VM (and vice-versa).