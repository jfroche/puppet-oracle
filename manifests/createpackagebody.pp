define oracle::createpackagebody (
  $schema,
  $body
)
{
    file {
      "/oracle/package/packagebody-${name}.sql":
        ensure  => present,
        content => template('oracle/createpackagebody.sql'),
        owner   => 'oracle',
        group   => 'oracle',
        require => [File['/oracle/package']]
    }

}
