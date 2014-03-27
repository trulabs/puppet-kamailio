# apt.pp

class kamailio::repo::apt inherits kamailio::repo {
  include '::apt'

  # Note the 40!
  apt::source { 'kamailio40_wheezy':
    location          => 'http://deb.kamailio.org/kamailio40',
    release           => 'wheezy',
    repos             => 'main',
    required_packages => 'debian-keyring debian-archive-keyring',
    key               => '07D5C01D',
    key_server        => 'http://deb.kamailio.org/kamailiodebkey.gpg',
    include_src       => true,
  }

  Apt::Source['kamailio40_wheezy'] -> Package<|tag == 'kamailio'|>
}
