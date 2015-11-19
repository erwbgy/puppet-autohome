# _Unmaintained_

I no longer use Puppet actively and this software has not been maintained for some time.

# puppet-autohome

Automount home directories

## Usage: autohome::client

Include the autohome module in your puppet configuration:

    include autohome::client

and add required hiera configuration - for example:

    autohome::client::local_users:
      - oracle
    autohome::client::local_home:    /export/home
    autohome::client::remote_home:   10.7.96.13:/woking/home
    autohome::client::remote_fstype: nfs4

It can also be used as a parameterised class - for example:

    class { 'autohome::client':
      local_users   => [ 'oracle' ],
      local_home    => '/export/home',
      remote_home   => '10.7.16.13:/london/home',
      remote_fstype => 'nfs4',
    }

## Parameters: autohome::client

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

