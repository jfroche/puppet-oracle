define oracle::createsequence (
  $startwith = 1,
  $increment_by = 1,
  $min_value = 1,
)
{
  file {
    "/oracle/sequence/seq-${name}.sql":
      ensure  => present,
      content => template('oracle/createsequence.sql'),
      owner   => 'oracle',
      group   => 'oracle',
      require => File['/oracle/sequence'],
  }

}
