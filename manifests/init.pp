#
class networker (
  $install_nmda             = $networker::params::install_nmda,
  $ld_file                  = $networker::params::ld_file,
  $ld_file_source           = $networker::params::ld_file_source,
  $package_ensure           = $networker::params::package_ensure,
  $package_networker_client = $networker::params::package_networker_client,
  $package_networker_man    = $networker::params::package_networker_man,
  $package_networker_nmda   = $networker::params::package_networker_nmda,
  $servers                  = $networker::params::servers,
  $servers_file             = $networker::params::servers_file,
  $servers_file_array       = $networker::params::servers_file_array,
  $servers_template         = $networker::params::servers_template,
  $service_enable           = $networker::params::service_enable,
  $service_ensure           = $networker::params::service_ensure,
  $service_manage           = $networker::params::service_manage,
  $service_name             = $networker::params::service_name,
) inherits networker::params {

  validate_bool         ($install_nmda)
  validate_absolute_path($ld_file)
  validate_string       ($package_ensure)
  validate_array        ($package_networker_client)
  validate_array        ($package_networker_man)
  validate_array        ($package_networker_nmda)
  validate_array        ($servers)
  validate_absolute_path($servers_file)
  validate_array        ($servers_file_array)
  validate_string       ($servers_template)
  validate_bool         ($service_enable)
  validate_string       ($service_ensure)
  validate_bool         ($service_manage)
  validate_string       ($service_name)

  # Anchor this as per #8040 - this ensures that classes won't float off and
  # mess everything up.  You can read about this at:
  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  if $install_nmda {
    anchor { 'networker::begin': } -> 
    class { '::networker::install::client': } -> 
    class { '::networker::install::nmda': } -> 
    class { '::networker::config': } ~>
    class { '::networker::service': } ->
    anchor { 'networker::end': }
  }
  else {
    anchor { 'networker::begin': } -> 
    class { '::networker::install::client': } -> 
    class { '::networker::config': } ~>
    class { '::networker::service': } ->
    anchor { 'networker::end': }
  }

}
