class oracle {

  realize(User['oracle'], Group['oracle', 'dba'])
  realize(Yumrepo['oracle'])

  package{
    'oracle10g':
      ensure  => installed,
      require => Yumrepo['oracle'],
  }

}
