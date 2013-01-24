class autohome::client (
  $auto_home     = undef,
  $domain        = undef,
  $local_users   = undef,
  $local_home    = undef,
  $remote_home   = undef,
  $remote_fstype = undef,
) {
  $_local_users = hiera_array('autohome::client::local_users', $local_users)
  class { 'autohome::client::config':
    auto_home     => $auto_home,
    domain        => $domain,
    local_users   => $_local_users,
    local_home    => $local_home,
    remote_home   => $remote_home,
    remote_fstype => $remote_fstype,
  }
  include autohome::client::install
  include autohome::client::service
}
