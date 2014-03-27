puppet-kamailio
===============


=======

Overview
--------

The kamailio module provides a simple interface for managing Kamailio deployments with Puppet.

Module Description
------------------



sudo puppet apply -v environments//manifests/site.pp --modulepath modules/:/etc/puppet/modules/ --show_diff --noop

-- INSTALL A 3RD PARTY MODULE

$ sudo puppet module install

-- RUN PUPPET-LINT

$ puppet-lint --no-80chars-check --with-filename modules/<MODULE>/manifests/
