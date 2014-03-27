# params.pp

class kamailio::params {
  $service_enable = false
  $service_ensure = 'running'
  $service_manage = false

  $manage_repo    = false
  $package_ensure = 'present'
  $package_name   = 'kamailio'
}
