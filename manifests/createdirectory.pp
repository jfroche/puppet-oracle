define oracle::createdirectory (
  $path,
  $owner
)
{

  file {
    "/oracle/directory/createdirectory-${name}.sql":
      ensure  => present,
      content => template('oracle/createdirectory.sql'),
      owner   => 'oracle',
      group   => 'oracle',
      require => File['/oracle'],
  }

}

