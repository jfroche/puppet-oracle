define oracle::backup
(
  $db_user,
  $schema,
  $directory,
  $oracle_bin_path,
  $dumpfile
)
{
  $db_pass = hiera("oracle_${db_user}_password")
  file {
    "/oracle/bin/backup-${name}":
      ensure  => present,
      owner   => oracle,
      group   => oracle,
      mode    => '0755',
      content => template('oracle/backup'),
      require => File['/oracle/bin'],
  }
}
