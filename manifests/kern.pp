class oracle::kern {
  include sysctl

  sysctl::conf {
    'net.ipv4.ip_local_port_range': value => '1024 65000';
    'kernel.sem': value                   => '250 32000 100 128';
    'fs.file-max': value                  => '747266';
  }

  limits::conf {
    'oracle-nproc-soft':
      domain => 'oracle',
      type   => 'soft',
      item   => 'nproc',
      value  => 2047;
    'oracle-nproc-hard':
      domain => 'oracle',
      type   => 'hard',
      item   => 'nproc',
      value  => 16384;
    'oracle-nofile-soft':
      domain => 'oracle',
      type   => 'soft',
      item   => 'nofile',
      value  => 1024;
    'oracle-nofile-hard':
      domain => 'oracle',
      type   => 'hard',
      item   => 'nofile',
      value  => 65536;
  }

}
