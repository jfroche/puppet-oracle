class oracle {

  realize(User['oracle'], Group['oracle', 'dba'])
  realize(Yumrepo['oracle'])

  package {
    'glibc.i686':
      ensure  => installed,
      require => Class['yum::client']
  }
  package{
    'oracledb':
      ensure  => installed,
      require => Yumrepo['oracle'],
  }

}
