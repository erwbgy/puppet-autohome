class autohome::client::service {
  service { 'autofs':
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Class['autohome::client::config'],
  }
}
