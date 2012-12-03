class autohome::client::install {
  if ! defined(Package['autofs']) {
    package { 'autofs':  ensure => installed }
  }
}
