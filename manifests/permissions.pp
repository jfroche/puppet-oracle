define oracle::permissions ($permissions) {

  file {
    "/oracle/grant/grant-${name}.sql":
      ensure  => present,
      content => template('oracle/permission.sql'),
      owner   => 'oracle',
      group   => 'oracle',
      require => File['/oracle/grant']
  }

}
