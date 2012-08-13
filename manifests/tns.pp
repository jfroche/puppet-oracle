define oracle::tns (
  $oracle_home,
  $host,
  $port,
  $service
)
{

  concat::fragment {
    "tns_${name}_line":
      target  => "$oracle_home/network/admin/tnsnames.ora",
      content => template('oracle/tnsname'),
      require => Concat["$oracle_home/network/admin/tnsnames.ora"]
  }

}
