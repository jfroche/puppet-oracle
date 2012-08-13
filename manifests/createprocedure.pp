define oracle::createprocedure (
  $schema,
  $source
)
{
    file {
      "/oracle/procedure/procedure-${name}.sql":
        ensure  => present,
        source  => $source,
        owner   => 'oracle',
        group   => 'oracle',
        require => File['/oracle/procedure']
    }

}
