node default {
  class { 'nodejs':
    repo_url_suffix => '8.x'
  }

  file { '/srv/www':
    ensure => directory
  }

  file { '/srv/www/todo/':
    source       => '/tmp/app/',
    ensure       => directory,
    sourceselect => all,
    recurse      => true
  }

  exec { '/usr/bin/npm install -g serve':
    user => 'root'
  }

  exec { '/usr/bin/nohup /usr/bin/serve -s /srv/www/todo/build > /dev/null 2>&1 &':
    user => 'root'
  }

  package { 'firewalld': }

  service { 'firewalld':
    enable     => true,
    ensure => 'running'
  }

  # we'll use this when setting up nginx
  exec { 'firewall-cmd --zone=public --permanent --add-service=http':
    user => 'root',
    path => '/usr/bin'
  }

  exec { 'firewall-cmd --zone=public --permanent --add-port=5000':
    user => 'root',
    path => '/usr/bin'
  }
}
