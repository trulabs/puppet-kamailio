# repo.pp

class kamailio::repo inherits kamailio {
  case $::osfamily {
    'Debian': {
      class { 'kamailio::repo::apt': }
    }
    default: {
    }
  }
}
