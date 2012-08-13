define oracle::createmv (
  $schema,
  $dblink,
  $grant_to_user,
  $refresh_group_schema,
  $refresh_group_name
)
{

  file {
    "/oracle/mv/mv-${schema}-${name}.sql":
      ensure  => present,
      content => template('oracle/createfastmv.sql'),
      owner   => 'oracle',
      group   => 'oracle',
      require => File['/oracle'],
  }

}
