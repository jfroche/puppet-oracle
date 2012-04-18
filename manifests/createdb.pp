define oracle::createdb (
  $oracle_home,
  $oradata,
  $sys_password = hiera('oracle_sys_password'),
  $system_password = hiera('oracle_system_password'),
  $charset = 'AL32UTF8',
  $national_charset = 'AL16UTF16'
  ){

  file {
    '/etc/profile.d/oracle.sh':
      content => "export ORACLE_HOME=$oracle_home;export ORACLE_SID=$name",
      owner   => 'root',
      mode    => '0644'
  }


  file {
    "/oracle/createdb-$name.sql":
      ensure  => present,
      content => template('oracle/createdb.sql'),
      owner   => 'oracle',
      group   => 'oracle',
      require => File['/oracle'],
  }
}
