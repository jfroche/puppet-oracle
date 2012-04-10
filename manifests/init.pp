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
  file {
    '/oracle':
      ensure  => directory,
      owner   => 'oracle',
      group   => 'oracle',
      require => [
        File['/opt/standard.rsp'],
        User['oracle'],
        Group['oracle', 'dba'],
        Package['oracledb'],
      ],
  }
  file {
    '/opt/standard.rsp':
      ensure  => present,
      content => template('oracle/standard.rsp.erb'),
      require => Package['oracledb'],
  }
  exec {
    '/opt/oracle/database/runInstaller -silent -responseFile /opt/standard.rsp':
      user    => 'oracle',
      require => [
        File['/opt/standard.rsp', '/oracle'],
        User['oracle'],
        Group['oracle', 'dba'],
        Package['oracledb'],
      ],
      creates => '/u01/app/oracle/oracle/product/10.2.0/db_1/',
  }

}
