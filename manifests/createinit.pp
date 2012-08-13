define oracle::createinit (
  $oracle_home = hiera('oracle_home'),
  $dbname,
  $oraadmin,
  $oradata,
  $control_files
)
{

  file {
    "$oracle_home/dbs/init$dbname.ora":
      ensure   => 'present',
      content  => template('oracle/init.ora')
  }
  file {
    $oradata:
      ensure  => directory,
      owner   => 'oracle',
      group   => 'oracle';
    $oraadmin:
      ensure => directory,
      owner  => 'oracle',
      group  => 'oracle';
    "$oradata/$dbname":
      ensure  => directory,
      owner   => 'oracle',
      group   => 'oracle',
      require => File[$oradata];
    "$oraadmin/$dbname":
      ensure  => directory,
      owner   => 'oracle',
      group   => 'oracle',
      require => File[$oraadmin];
    "$oraadmin/$dbname/adump":
      ensure  => directory,
      owner   => 'oracle',
      group   => 'oracle',
      require => File["$oraadmin/$dbname"];
    "$oraadmin/$dbname/bdump":
      ensure  => directory,
      owner   => 'oracle',
      group   => 'oracle',
      require => File["$oraadmin/$dbname"];
    "$oraadmin/$dbname/cdump":
      ensure  => directory,
      owner   => 'oracle',
      group   => 'oracle',
      require => File["$oraadmin/$dbname"];
    "$oraadmin/$dbname/udump":
      ensure  => directory,
      owner   => 'oracle',
      group   => 'oracle',
      require => File["$oraadmin/$dbname"];
  }

}
