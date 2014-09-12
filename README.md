puppet-kamailio
===============

## Description

Puppet module for Kamailio


=======

Overview
--------

This module provides a simple interface for managing Kamailio deployments with Puppet.

Module Description
------------------

Kamailio is a very fast and configurable SIP proxy.
[kamailio.org](http://www.kamailio.org/w/)

Setup
-----

For the minimal setup, add:

    include 'kamailio'

in your manifest.

You may want to configure a few options, e.g.:

    class { '::kamailio':
        service_manage  => true,
        service_enable  => true,
        service_ensure  => 'running',
        manage_repo     => true,
        with_tls        => true,
        with_websockets => true,
        with_ephem_auth => true,
        manage_config   => false,
    }


Author
------

    Truphone Labs
    Giacomo Vacca <giacomo.vacca@gmail.com>

License
-------

See LICENSE file.

##Limitations

This module has been built and tested with Puppet 2.7.

The module has been tested on:
* Debian 7

##Contributors
The list of contributors can be found at: [https://github.com/trulabs/puppet-kamailio/graphs/contributors](https://github.com/trulabs/puppet-kamailio/graphs/contributors)
