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
	# Flush the uid and gid cache to avoid 'nobody:nobody' file and
	# directory ownership issues
        case $operatingsystemrelease {
          '6.3': {
            exec { 'clear-idmapd-cache':
              command => '/usr/sbin/nfsidmap -c',
              require => Service['rpcidmapd'],
            }
          }
          default: {
            exec { 'restart-rpcidmapd':
              command => '/sbin/service rpcidmapd restart',
              require => Service['rpcidmapd'],
            }
          }
        }
      }
      default: {
        warning("$operatingsystem not currently supported")
      }
    }
  }
}
