#nodes.pp

node 'YOUR HOST NAME HERE' {

  class { '::kamailio':
    service_manage => true,
    service_enable => true,
    service_ensure => 'running',
    manage_repo    => true,
  }
}

node 'debian7' {

  class { '::kamailio':
    service_manage => true,
    service_enable => true,
    service_ensure => 'running',
    manage_repo    => true,
  }
}
