#config.pp

class kamailio::config (
  $with_tls = false
) inherits kamailio {
  File {
    owner => 'root',
    group => 'root',
  }

  file { '/etc/kamailio/kamailio.cfg':
    content => template('kamailio/kamailio.cfg.erb'),
    mode    => '0644',
    notify  => Class['kamailio::service'],
  }

  file { '/etc/default/kamailio':
    content => template('kamailio/etc_default_kamailio.erb'),
    mode    => '0644',
    notify  => Class['kamailio::service'],
  }
}
