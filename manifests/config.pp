#
class networker::config inherits networker {

  file { $servers_file_array:
    ensure  => directory,
    owner   => 0,
    group   => 0,
    mode    => '0655',
  }

  file { $servers_file:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template($servers_template),
    require => File[$servers_file_array],
  }

#quick and dirty way to ensure nmda works after upgrade
  if $install_nmda {
    file { $ld_file:
      ensure  => file,
      owner   => 0,
      group   => 0,
      mode    => '644',
      source  => 'puppet:///modules/networker/ld.nsr.conf',
    }
#the default is no good
    file { '/etc/ld.so.conf.d/nsr':
      ensure  => absent,
    }
  }

}
