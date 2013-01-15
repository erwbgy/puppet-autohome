# puppet-autohome

Automount home directories

## Example: client

    autohome::client::local_users:
      - oracle
    autohome::client::local_home:    /export/home
    autohome::client::remote_home:   10.7.96.13:/woking/home
    autohome::client::remote_fstype: nfs4

## autohome::client parameters

*auto_home*: The base directory under which user automounted home directories
will be mounted. Default: '/home'

*local_users*: The list of local users who should not have home directories
automounted

*local_home*: The base directory under which local user home directories are
located. Default: '/var/local/home'

*remote_home*: The base remote directory to automount from - for example an NFS
host and path

*remote_fstype*: The remote filesystem type. Default: 'nsf4'

## TODO

* Configure the server side

## Credits

This is based on detailed documentation and setup by my colleague Neil
McBennett.  He did all the hard work, I just puppetised it.

