define oracle::script
(
  $db_user,
  $sql,
  $oracle_bin_path,
  $sysdba = false,
  $ensure = present,
)
{
  $db_pass = hiera("oracle_${db_user}_password")

  file {
    "/oracle/bin/$name":
      ensure  => $ensure,
      owner   => oracle,
      group   => oracle,
      mode    => '0755',
      content => template('oracle/oraclescript'),
      require => File['/oracle/bin'],
  }
}
