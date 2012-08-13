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
      line    => template('oracle/tnsname'),
      require => Concat["$oracle_home/network/admin/tnsnames.ora"]
  }

}
