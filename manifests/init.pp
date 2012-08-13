class oracle (
  $oracle_home = hiera('oracle_home')
)
  {

  realize(User['oracle'], Group['oracle', 'dba'])
  realize(Yumrepo['oracle'])

  package {
    'make':
      ensure  => installed,
  }
  package {
    'gcc':
      ensure  => installed,
  }
  package {
    'binutils':
      ensure  => installed,
      require => Package['binutils-devel.x86_64', 'binutils-devel.i686']
  }
  package {
    'binutils-devel.x86_64':
      ensure  => installed,
  }
  package {
    'binutils-devel.i686':
      ensure  => installed,
  }
  package {
    'compat-libstdc++-33.i686':
      ensure  => installed,
  }
  package {
    'compat-libstdc++-33.x86_64':
      ensure  => installed,
  }
  package {
    'glibc-devel.i686':
      ensure  => installed,
  }
  package {
    'libgcc.i686':
      ensure  => installed,
  }
  package {
    'glib-devel.i686':
      ensure  => installed,
  }
  package {
    'glibc.i686':
      ensure  => installed,
      require => Class['yum::client']
  }
  package{
    'oracledb':
      ensure  => installed,
      require => Yumrepo['oracle'],
  }
  file {
    '/oracle':
      ensure  => directory,
      owner   => 'oracle',
      group   => 'oracle',
      require => [
        File['/opt/standard.rsp'],
        User['oracle'],
        Group['oracle', 'dba'],
        Package['oracledb'],
      ],
  }
  file {
    '/opt/standard.rsp':
      ensure  => present,
      content => template('oracle/standard.rsp.erb'),
      require => Package['oracledb'],
  }
  exec {
    'install_oracle':
      command => '/opt/oracle/database/runInstaller -silent -responseFile /opt/standard.rsp',
      user    => 'oracle',
      require => [
        File['/opt/standard.rsp', '/oracle'],
        User['oracle'],
        Group['oracle', 'dba'],
        Package[
          'oracledb',
          'binutils',
          'compat-libstdc++-33.x86_64',
          'compat-libstdc++-33.i686',
          'make',
          'gcc',
          'libgcc.i686',
          'glibc-devel.i686',
          'glib-devel.i686'
          ],
      ],
      creates => '/u01/app/oracle/oracle/product/10.2.0/db_1/',
  }
  exec {
    '/oracle/oraInventory/orainstRoot.sh':
      creates => '/etc/oraInst.loc',
      require => Exec['install_oracle'],
  }

  file {
    '/u01/oracle':
      ensure => directory,
      owner  => 'oracle',
      group  => 'oracle'
  }

  file {
    '/u01/oracle/app':
      ensure => directory,
      owner  => 'oracle',
      group  => 'oracle'
  }

  include concat::setup

  concat {
    "$oracle_home/network/admin/tnsnames.ora":
      owner   => 'oracle',
      group   => 'oracle',
      require => Exec['install_oracle']
  }

  file {
    '/oracle/mv':
      ensure  => directory,
      owner   => 'oracle',
      group   => 'oracle',
      require => File['/oracle'];
    '/oracle/view':
      ensure  => directory,
      owner   => 'oracle',
      group   => 'oracle',
      require => File['/oracle'];
    '/oracle/function':
      ensure  => directory,
      owner   => 'oracle',
      group   => 'oracle',
      require => File['/oracle'];
    '/oracle/package':
      ensure  => directory,
      owner   => 'oracle',
      group   => 'oracle',
      require => File['/oracle'];
    '/oracle/procedure':
      ensure  => directory,
      owner   => 'oracle',
      group   => 'oracle',
      require => File['/oracle'];
  }

}
