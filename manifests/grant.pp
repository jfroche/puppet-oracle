define oracle::grant (
  $name,
  $permission,
  $users = [],
)
{

  file {
    "/oracle/grant/grant-${name}-${permission}.sql":
      ensure  => present,
      content => template('oracle/grant.sql'),
      owner   => 'oracle',
      group   => 'oracle',
      require => File['/oracle/table']
  }

}
