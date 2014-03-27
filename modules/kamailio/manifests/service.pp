# service.pp
class kamailio::service (
  $service_ensure,
  $service_manage,
  $service_enable
) inherits kamailio {

  if ! ($service_ensure in ['running', 'stopped']) {
    fail('service_ensure parameter must be running or stopped')
  }

  if ($service_manage) {
    service { 'kamailio':
      ensure     => $service_ensure,
      enable     => $service_enable,
      hasstatus  => true,
      hasrestart => true,
      restart    => '/etc/init.d/kamailio restart',
      start      => '/etc/init.d/kamailio start',
      stop       => '/etc/init.d/kamailio stop',
    }
  }
}
