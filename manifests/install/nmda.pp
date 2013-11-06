#
class networker::install::nmda inherits networker {

  package { 'networker-nmda':
    ensure => $package_ensure,
    name   => $package_networker_nmda,
  }

}
