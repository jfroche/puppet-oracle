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
      group   => 'oracle'
  }

  file_line {
    "tns_${name}_line":
      ensure  => present,
      path    => "$oracle_home/network/admin/tnsnames.ora",
      line    => template('oracle/tnsname'),
      require => File["$oracle_home/network/admin/tnsnames.ora"]
  }

}
