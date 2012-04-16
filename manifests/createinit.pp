define oracle::createinit (
  $oracle_home,
  $dbname,
  $oraadmin,
  $oradata,
  $controlfiles
)
{

  file {
    "$oracle_home/dbs/init$dbname.ora":
      ensure   => 'present',
      template => template('oracle/init.ora')
  }

}
