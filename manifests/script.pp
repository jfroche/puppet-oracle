define oracle::script
(
  $db_user,
  $sql,
  $oracle_bin_path,
  $sysdba = false,
  $lock = true,
  $ensure = present,
)
{
  $db_pass = hiera("oracle_${db_user}_password")

  if $lock {
    $script_template = 'oracle/oraclescript-lock'
  }
  else {
    $script_template = 'oracle/oraclescript'
  }

  file {
    "/oracle/bin/$name":
      ensure  => $ensure,
      owner   => oracle,
      group   => oracle,
      mode    => '0755',
      content => template($script_template),
      require => File['/oracle/bin'],
  }
}
