define oracle::createrefreshgroup (
  $schema
)
{
  file {
    "/oracle/refresh-group-$name.sql":
      ensure   => present,
      owner    => 'oracle',
      group    => 'oracle',
      content  => template('oracle/createrefreshgroup.sql')
  }
}
