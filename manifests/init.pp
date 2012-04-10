class oracle {

  realize(User['oracle'], Group['oracle', 'dba'])
  realize(Yumrepo['oracle'])

  package{
    'oracledb':
      ensure  => installed,
      require => Yumrepo['oracle'],
  }

}
