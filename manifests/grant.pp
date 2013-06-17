define oracle::grant (
  $object,
  $permissions = [],
  $users = [],
)
{

  file {
    "/oracle/grant/grant-${object}-${name}.sql":
      ensure  => present,
      content => template('oracle/grant.sql'),
      owner   => 'oracle',
      group   => 'oracle',
      require => File['/oracle/grant']
  }

}
