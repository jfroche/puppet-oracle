define oracle::createtable (
  $fields,
  $grant_to_users = [],
)
{

  file {
    "/oracle/table/table-${name}.sql":
      ensure  => present,
      content => template('oracle/createview.sql'),
      owner   => 'oracle',
      group   => 'oracle',
      require => File['/oracle']
  }

}
