define oracle::createdblink (
  $remote_username,
  $remote_password,
  $service_name
)
{

  file {
    "/oracle/createdblink-$name.sql":
      ensure  => present,
      content => template('oracle/createdblink.sql'),
      owner   => 'oracle',
      group   => 'oracle',
      require => File['/oracle'],
  }

}
