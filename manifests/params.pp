#
class networker::params {

  $package_ensure   = 'present'
  $servers_template = 'networker/servers.erb'
  $service_enable   = true
  $service_ensure   = 'running'
  $service_manage   = true

  $ld_file_source   = '/etc/ld.so.conf.d/nsr.conf'
  $install_nmda     = false
  

#networker uses lots of packages, unfortunately

  case $::osfamily {
    'RedHat': {
      $ld_file                         = '/etc/ld.so.conf.d/nsr.conf'
      $package_networker_client        = [ 'lgtoclnt' ]
      $package_networker_man           = [ 'lgtoman' ]
      $package_networker_nmda          = [ 'lgtonmda' ]
      $service_name                    = 'networker'
      $servers_file_array              = [ '/nsr', '/nsr/res' ]
      $servers_file                    = '/nsr/res/servers'
      $servers                         = [
        'server1.example.com',
        'server2.example.com',
      ]
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}
