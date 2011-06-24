class ddclient (
    $host,
    $user,
    $pass
  ) {

  include ddclient::params
  $conf = $ddclient::params::conf
  $cmd  = $ddclient::params::cmd

  package { "ddclient": ensure => installed; }

  file {
    "$conf":
      owner   => root,
      group   => 0,
      mode    => 600,
      content => template("ddclient/ddclient.conf.erb");
  }

  cron {
    "ddclient":
      user    => root,
      command => "$cmd",
      minute  => "*/15";
  }

}

