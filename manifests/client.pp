class autohome::client (
  $auto_home     = undef,
  $local_users   = undef,
  $local_home    = undef,
  $remote_home   = undef,
  $remote_home   = undef,
  $remote_fstype = undef,
) {
  class { 'autohome::client::config':
    auto_home     => $auto_home,
    local_users   => $local_users,
    local_home    => $local_home,
    remote_home   => $remote_home,
    remote_fstype => $remote_fstype,
  }
  include autohome::client::install
  include autohome::client::service
}
