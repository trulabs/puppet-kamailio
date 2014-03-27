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

Run
---
sudo puppet apply -v environments/ENVIRONMENT/manifests/site.pp --modulepath modules/:/etc/puppet/modules/ --show_diff --noop

Install a 3rd party module
--------------------------

$ sudo puppet module install

Run puppet-lint
---------------

$ puppet-lint --no-80chars-check --with-filename modules/kamailio/manifests/

Author
------

Truphone Labs
Giacomo Vacca <giacomo.vacca@gmail.com>

License
-------

See LICENSE file.
