class autohome::client::config (
  $remote_home,
  $domain,
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
  if $remote_fstype == 'nfs4' {
    file { '/etc/idmapd.conf':
      ensure  => present,
      mode    => '0644',
      content => template('autohome/client/idmapd.conf.erb'),
      require => Class['autohome::client::install'],
      notify  => Class['autohome::client::service'],
    }
  }
  exec { 'create-local-home':
    command => "/bin/mkdir -p ${local_home}",
    creates => $local_home,
  }
}
