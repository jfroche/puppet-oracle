define oracle::tns (
  $oracle_home,
  $host,
  $port,
  $service
)
{

  file_line {
    "tns_${name}_line":
      path => "$oracle_home/network/admin/tnsnames.ora",
      line => template('oracle/tnsname')
  }

}
