puppet-kamailio
===============

## Description

Puppet module for Kamailio


=======

Overview
--------

The kamailio module provides a simple interface for managing Kamailio deployments with Puppet.

Module Description
------------------

Kamailio is a very fast and configurable SIP proxy.
http://www.kamailio.org/w/

Setup
-----

Add:
include 'kamailio'
in your node definition.


sudo puppet apply -v environments/ENVIRONMENT/manifests/site.pp --modulepath modules/:/etc/puppet/modules/ --show_diff --noop

-- INSTALL A 3RD PARTY MODULE

$ sudo puppet module install

-- RUN PUPPET-LINT

$ puppet-lint --no-80chars-check --with-filename modules/kamailio/manifests/

Author
------

Truphone Labs

License
-------

See LICENSE file.
