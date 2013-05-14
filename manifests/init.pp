class oracle (
  $oraclesupport_username,
  $oraclesupport_password,
  $oracle_home,
  $oracle_base
)
  {

  realize(User['oracle'], Group['oracle', 'dba'])

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
#  package {
#    'glib-devel.i686':
#      ensure  => installed,
#  }
  package {
    'glibc.i686':
      ensure  => installed
  }
  package{
    'oracledb':
      ensure  => installed,
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
  file {
    '/etc/oraInv':
      ensure => directory,
      owner  => 'oracle',
      group  => 'dba'
  }

  exec {
    'install_oracle':
      command => '/opt/oracle/database/runInstaller -silent -responseFile /opt/standard.rsp',
      user    => 'oracle',
      require => [
        File['/opt/standard.rsp', '/oracle', '/etc/oraInv'],
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
          'glibc-devel.i686'
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

  file {
    '/etc/profile.d/oracle_path.sh':
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      content => 'export PATH=$PATH:/u01/app/oracle/oracle/product/10.2.0/db_1/bin:/oracle/bin'
  }

  concat {
    "$oracle_home/network/admin/tnsnames.ora":
      owner   => 'oracle',
      group   => 'oracle',
      require => Exec['install_oracle']
  }

  file {
    '/oracle/bin':
      ensure  => directory,
      owner   => 'oracle',
      group   => 'oracle',
      require => File['/oracle'];
    '/oracle/mv':
      ensure  => directory,
      owner   => 'oracle',
      group   => 'oracle',
      require => File['/oracle'];
    '/oracle/table':
      ensure  => directory,
      owner   => 'oracle',
      group   => 'oracle',
      require => File['/oracle'];
    '/oracle/view':
      ensure  => directory,
      owner   => 'oracle',
      group   => 'oracle',
      require => File['/oracle'];
    '/oracle/sequence':
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
