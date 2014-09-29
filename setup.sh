apt-get update
apt-get install -y puppet
puppet module install puppetlabs-apt
puppet module install trulabs-kamailio
mkdir puppet-kamailio && cd puppet-kamailio/
echo "node 'default' { class { 'kamailio': manage_repo => true }}" > site.pp
puppet apply -v site.pp --modulepath .:/etc/puppet/modules/ --show_diff --noop
puppet apply -v site.pp --modulepath .:/etc/puppet/modules/ --show_diff
dpkg -l kamailio
