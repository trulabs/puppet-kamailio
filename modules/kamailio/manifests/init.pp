# init.pp
class kamailio(
  $service_enable = $kamailio::params::service_enable,
  $service_ensure = $kamailio::params::service_ensure,
  $service_manage = $kamailio::params::service_manage,
  $manage_repo    = $kamailio::params::manage_repo,
  $package_ensure = $kamailio::params::package_ensure,
  $package_name   = $kamailio::params::package_name
) inherits kamailio::params {

  validate_string($package_ensure, $package_name)
  validate_bool($service_enable, $service_manage, $manage_repo)

  class { '::kamailio::install':
    package_ensure => $package_ensure,
    package_name   => $package_name,
  } ->
  class { '::kamailio::config': }  ->
  class { '::kamailio::service':
    service_ensure => $service_ensure,
    service_manage => $service_manage,
    service_enable => $service_enable,
  }

  if ($manage_repo) {
    class { '::kamailio::repo': }
  }
}
