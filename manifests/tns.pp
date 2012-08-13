define oracle::tns (
  $oracle_home = hiera('oracle_home'),
  $host,
  $port,
  $service
)
{

  concat::fragment {
    "tns_${name}_line":
      target  => "$oracle_home/network/admin/tnsnames.ora",
      content => template('oracle/tnsname')
  }

}
