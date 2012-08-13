define oracle::createrefreshgroup (
  $schema
)
{
  file {
    "/oracle/refresh-group-$name.sql":
      ensure   => present,
      content  => template('oracle/createrefreshgroup.sql')
  }
}
