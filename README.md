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

**On an empty host:**

    apt-get update && apt-get install -y puppet
    ## This will also pull puppetlabs-apt and puppetlabs-stdlib
    puppet module install trulabs-kamailio
    puppet apply -v /etc/puppet/modules/kamailio/tests/init.pp --show_diff --noop



Parameters
----------

#####`service_manage`

If set to true, Puppet takes care of the service according to `service_enable` and `service_ensure`. Default is 'true'.

#####`service_enable`

Configures whether Kamailio should be enabled. Applies if `service_manage` is true. Default is 'true'.

#####`service_ensure`

If `service_manage` is true and `service_enable` is true, this parameter tells Puppet whether Kamailio should be running. Default is 'running'.


#####`manage_repo`

Should Puppet manage apt sources?

#####`with_tls`

Whether TLS should be enabled, plus basic configuration.

#####`with_websockets`

Whether the WebSockets module should be installed.

#####`with_ephem_auth`

Whether the ephemeral authentication module should be installed.

#####`manage_config`

Should Puppet deploy the configuration files?

#####`package_ensure`

Version or status of the package, e.g. 'latest' (which is also default) or '4.1.6+wheezy'


Author
------

    Truphone Labs
    Giacomo Vacca <giacomo.vacca@gmail.com>

License
-------

See LICENSE file.

##Tests

Run tests with:
    sudo puppet apply -v tests/init.pp --modulepath modules/:/etc/puppet/modules --show_diff --noop

##Limitations

This module has been built and tested with Puppet 2.7.

The module has been tested on:
* Debian 7

##Contributors
The list of contributors can be found at: [https://github.com/trulabs/puppet-kamailio/graphs/contributors](https://github.com/trulabs/puppet-kamailio/graphs/contributors)
