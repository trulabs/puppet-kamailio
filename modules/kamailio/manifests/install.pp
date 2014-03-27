# install.pp
class kamailio::install (
  $package_ensure,
  $package_name
) inherits kamailio {

  package { 'kamailio':
    ensure => $package_ensure,
    name   => $package_name,
  }
}
