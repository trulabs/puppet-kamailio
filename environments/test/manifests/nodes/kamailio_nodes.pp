#nodes.pp

node 'YOURHOSTNAMEHERE' {

  class { '::kamailio':
    service_manage  => true,
    service_enable  => true,
    service_ensure  => 'running',
    manage_repo     => true,
    with_tls        => true,
    with_websockets => true,
    manage_config   => true,
  }
}

node 'debian7' {

  class { '::kamailio':
    service_manage  => true,
    service_enable  => true,
    service_ensure  => 'running',
    manage_repo     => true,
    with_tls        => true,
    with_websockets => true,
    manage_config   => true,
  }
}
