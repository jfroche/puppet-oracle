define oracle::createdatafile (
  $tablespace,
  $path,
  $initial_size,
  $auto_extend = 'ON',
  $next_extend_size = '100 M',
  $max_size = 'UNLIMITED'
)
{

  file {
    "/oracle/createdatafile-$name.sql":
      ensure  => present,
      content => template('oracle/createdatafile.sql'),
      owner   => 'oracle',
      group   => 'oracle',
      require => File['/oracle'],
  }

}
