class oracle::kern {
  include sysctl

  sysctl::conf {
    'net.ipv4.ip_local_port_range': value => '1024 65000';
    'kernel.sem': value                   => '250 32000 100 128';
    'fs.file-max': value                  => '747266';
  }

}
