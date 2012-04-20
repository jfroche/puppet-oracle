define oracle::tns (
  $oracle_home,
  $host,
  $port,
  $service
)
{

  file {
    "$oracle_home/network/admin/tnsnames.ora":
      ensure  => present,
      owner   => 'oracle',
      group   => 'oracle',
      replace => false
  }

  file_line {
    "tns_${name}_line":
      path    => "$oracle_home/network/admin/tnsnames.ora",
      line    => template('oracle/tnsname'),
      require => File["$oracle_home/network/admin/tnsnames.ora"]
  }

}
