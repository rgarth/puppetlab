# Cron Puppet class
#
# This class just setups a script to apply local puppet configs,
# and a 30 minute cron instead of the agent

class profile::cron_puppet {
    file { 'puppet-apply':
        ensure  => file,
        path    => '/usr/local/bin/puppet-apply',
        source  => 'puppet:///modules/profile/cron_puppet/puppet-apply',
        mode    => '0755',
        owner   => root,
        group   => root,
    }
    cron { 'puppet-apply':
        ensure  => present,
        command => "/usr/local/bin/puppet-apply",
        user    => root,
        minute  => '*/30',
        require => File['puppet-apply'],
    }
}
