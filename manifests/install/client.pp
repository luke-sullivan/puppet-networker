#
class networker::install::client inherits networker {

  package { 'networker-client':
    ensure => $package_client_version,
    name   => $package_networker_client,
  }

  package { 'networker-man':
    ensure => $package_ensure,
    name   => $package_networker_man,
  }

}
