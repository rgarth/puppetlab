class default_fw {
  resources { 'firewall':
    purge => true,
  }
  Firewall {
    before  => Class['default_fw::post'],
    require => Class['default_fw::pre'],
  }
  class { ['default_fw::pre', 'default_fw::post']: }
  class { firewall: }

}

