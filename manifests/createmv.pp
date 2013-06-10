define oracle::createmv (
  $dblink,
  $grant_to_users,
  $refresh_group_schema,
  $refresh_group_name,
  $query = '',
  $template = 'createfastmv.sql'
)
{

  file {
    "/oracle/mv/mv-${name}.sql":
      ensure  => present,
      content => template("oracle/${template}"),
      owner   => 'oracle',
      group   => 'oracle',
      require => File['/oracle/mv'],
  }

}
