class autohome::client::config (
  $remote_home,
  $auto_home     = '/home',
  $local_users   = [],
  $local_home    = '/var/local/home',
  $remote_fstype = 'nfs4',
) {
  # defaults
  File {
    owner => 'root',
    group => 'root',
  }
  file { '/etc/auto.master':
    ensure  => present,
    mode    => '0444',
    content => template('autohome/client/auto.master.erb'),
    require => Class['autohome::client::install'],
    notify  => Class['autohome::client::service'],
  }
  file { '/etc/auto.home':
    ensure  => present,
    mode    => '0444',
    content => template('autohome/client/auto.home.erb'),
    require => Class['autohome::client::install'],
    notify  => Class['autohome::client::service'],
  }
}
