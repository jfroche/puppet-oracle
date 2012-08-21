define oracle::createtempdatafile (
  $tablespace,
  $path,
  $initial_size,
  $auto_extend = 'ON',
  $next_extend_size = '100 M',
  $max_size = 'UNLIMITED'
)
{

  file {
    "/oracle/createtempdatafile-$name.sql":
      ensure  => present,
      content => template('oracle/createtempdatafile.sql'),
      owner   => 'oracle',
      group   => 'oracle',
      require => File['/oracle'],
  }

}
