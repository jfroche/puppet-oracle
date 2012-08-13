define oracle::createview (
  $sql
)
{

  file {
    "/oracle/view/view-${name}.sql":
      ensure  => present,
      content => template('oracle/createview.sql'),
      owner   => 'oracle',
      group   => 'oracle',
      require => File['/oracle']
  }

}
