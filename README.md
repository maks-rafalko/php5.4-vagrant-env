# Chef solo PHP 5.4 environment

## Description

Chef solo config files to install a php 5.4 environment that can be used with vagrant or deployed to AWS.

## Includes

* Ubuntu Precise 64
* php 5.4
* apache
* mysql
* sqlite
* git
* ntp
* vim
* zsh

## Installation

### install and run vagrant

    $ gem install vagrant
    $ vagrant up

When vagrant is done, you should see the apache default ```index.html``` file in the ```www``` folder. Open [http://localhost:8080/](http://localhost:8080/) to test it.

### git submodules
    
    $ git submodule init && git submodule update

## Run on an EC2 instance

### Requirements

you will need the key .pem file and the public DNS of your instance.

install [kinfe-solo](https://github.com/matschaffer/knife-solo)

    $ gem install knife-solo

Create a config file (ignore the warnings)

    $ knife configure -r . --defaults

Install ruby and vagrant on your instance

    $ knife prepare -i ~/path/to/file.pem ubuntu@ec2-your-public-dns.compute-1.amazonaws.com

It will also generate a json file in the ```/nodes``` folder. replace its contents with

```
  { "run_list": ["role[web]"] }
```

Deploy the chef solo config to your instance

    $ knife cook -i ~/path/to/file.pem ubuntu@ec2-your-public-dns.compute-1.amazonaws.com

## License 

(The MIT License)

Copyright (c) 2012 &lt;alex@binarypattern.com&gt;

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
