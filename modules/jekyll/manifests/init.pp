class jekyll {
  include jekyll::dependencies

  exec { "bundle":
    command => "bundle install --gemfile /jekyll/Gemfile",
    path => "/usr/bin:/usr/sbin:/bin:/usr/local/bin:/opt/ruby/bin",
    user => root,
    require => Class["jekyll::dependencies"]
  }

  exec { "foreman-upstart":
    command => "bundle exec foreman export upstart /etc/init -u root",
		cwd => "/jekyll",
    path => "/usr/bin:/usr/sbin:/bin:/usr/local/bin:/opt/ruby/bin",
    require => [Exec['bundle']]
  }

  service { 'jekyll':
    ensure => running,
    provider => upstart,
    require => [Exec['bundle'], Exec['foreman-upstart']]
  }
}
