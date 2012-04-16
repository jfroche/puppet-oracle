define oracle::createinit (
  $oracle_home,
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

}
