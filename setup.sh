apt-get update && apt-get install -y puppet

## This will also pull puppetlabs-apt and puppetlabs-stdlib
puppet module install trulabs-kamailio

puppet apply -v /etc/puppet/modules/asterisk/tests/init.pp --show_diff --noop
