# puppet-autohome

Automount home directories

## Example

autohome::client::local_users:
  - oracle
autohome::client::local_home:    /export/home
autohome::client::remote_home:   10.7.96.13:/woking/home
autohome::client::remote_fstype: nfs4

## Credits

This is based on detailed documentation and setup by my colleague Neil
McBennett.  He did all the hard work, I just puppetised it.
