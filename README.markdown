#networker 

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with networker](#setup)
    * [What networker affects](#what-networker-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with networker](#beginning-with-networker)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)
7. [TODO - future plans](#todo)

##Overview

Management of EMC/Legato Networker software.

##Module Description

Install and configure EMC/Legato Networker backup agents (maybe servers/dpa in a future version).

##Setup

###What Networker affects

* Networker packages (lgtoclnt, lgtoman, lgtnmda).
* Networker configurations files.
* Networker service.

###Beginning with Networker

Basic install: `include '::networker'`.
You should also configure your backup servers:
```puppet
class { '::networker':
  servers => [ 'server1', 'server2' ]
}
```

You may also opt for installing the nmda module with
```puppet
class { '::networker':
  install_nmda => true
}
```
##Usage

You may also customize the location of the `/nsr/res/servers` by overwriting the variables `$servers_file` and `$servers_file_array`.

Due to current puppet limitations, the `$servers_file_array` variable should contain the whole tree to where to servers file is.

Example:
```puppet
$servers_file => '/path/to/servers'
$servers_file_array => [ '/path', '/path/to' ]
```
This will not be validated by the module

##Reference

### Classes
* `networker::install::client`: Install client packages.
* `networker::install::nmda`: Install nmda package.
* `networker::config`: Configure Networker client

### Parameters

##Limitations

Tested on
* RedHat Enterprise Linux 5/6

with
* Networker 8.0.1

##Development

This module is open source. Any additions and feedbacks are welcome.

##TODO

* Manage nsrports
* Manage deployment of server
* Manage deployment of nmda
 