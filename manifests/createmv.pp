define oracle::createmv (
  $dblink,
  $grant_to_users,
  $refresh_group_schema,
  $refresh_group_name
)
{

  file {
    "/oracle/mv/mv-${name}.sql":
      ensure  => present,
      content => template('oracle/createfastmv.sql'),
      owner   => 'oracle',
      group   => 'oracle',
      require => File['/oracle'],
  }

}
