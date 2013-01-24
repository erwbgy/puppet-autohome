class autohome::client::service {
  service { 'autofs':
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Class['autohome::client::config'],
  }
  if $::autohome::client::config::remote_fstype == 'nfs4' {
    case $operatingsystem {
      'RedHat', 'CentOS': {
        # Ensure that the NFSv4 name mapping daemon is running
        service { 'rpcidmapd':
          ensure     => running,
          hasstatus  => true,
          hasrestart => true,
          enable     => true,
          require    => Class['autohome::client::config'],
        }
      }
      default: {
        warning("$operatingsystem not currently supported")
      }
    }
  }
}
