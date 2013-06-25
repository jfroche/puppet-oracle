define oracle::createmvlog {

  file {
    "/oracle/mvlog/mvlog-${name}.sql":
      ensure  => present,
      content => template('oracle/createmvlog.sql'),
      owner   => 'oracle',
      group   => 'oracle',
      require => File['/oracle/mvlog'],
  }

}
