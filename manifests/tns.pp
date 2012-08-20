define oracle::tns (
  $host,
  $port,
  $service,
  $oracle_home = hiera('oracle_home')
)
{

  concat::fragment {
    "tns_${name}_line":
      target  => "$oracle_home/network/admin/tnsnames.ora",
      content => template('oracle/tnsname')
  }

}
