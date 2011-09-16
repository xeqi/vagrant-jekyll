class jekyll::dependencies {
  package { "bundler": ensure => installed, provider => gem }
  package { "python-pygments": ensure => installed}
}

