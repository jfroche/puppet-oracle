define oracle::createuser (
  $password,
  $user_tablespace = 'USERS'
)
{

  file {
    "/oracle/createuser-${name}.sql":
      ensure  => present,
      content => template('oracle/createuser.sql'),
      owner   => 'oracle',
      group   => 'oracle',
      require => File['/oracle']
  }

}
