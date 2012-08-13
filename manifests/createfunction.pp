define oracle::createfunction (
  $sql = '',
  $source = ''
)
{

  if ($sql != '') {
    file {
      "/oracle/function/function-${name}.sql":
        ensure  => present,
        content => $sql,
        owner   => 'oracle',
        group   => 'oracle',
        require => File['/oracle/function']
    }
  }

  if ($source != '') {
    file {
      "/oracle/function/function-${name}.sql":
        ensure  => present,
        source  => $source,
        owner   => 'oracle',
        group   => 'oracle',
        require => File['/oracle/function']
    }
  }

}
