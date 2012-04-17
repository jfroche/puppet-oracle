define oracle::createdb (
  $oradata,
  $sys_password,
  $system_password,
  $charset = 'AL32UTF8',
  $national_charset = 'AL16UTF16'
  ){

  file {
    '/oracle/createdb-$name.sql':
      ensure  => present,
      content => template('oracle/createdb.sql'),
      owner   => 'oracle',
      group   => 'oracle',
      require => File['/oracle'],
  }
}
