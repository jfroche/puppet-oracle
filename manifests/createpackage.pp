define oracle::createpackage (
  $schema,
  $procedures
)
{
    file {
      "/oracle/package/package-${name}.sql":
        ensure  => present,
        content => template('oracle/createpackage.sql'),
        owner   => 'oracle',
        group   => 'oracle',
        require => [File['/oracle/package'], Oracle::Createprocedure[$procedures]]
    }

}
