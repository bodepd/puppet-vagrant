#
# installs virtual box
#
# Only supported on Ubuntu Precise
#
class vagrant {

  apt::source { 'virtualbox':
    location    => 'http://download.virtualbox.org/virtualbox/debian',
    key         => '98AB5139',
    key_source  => 'http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc',
    repos       => 'contrib',
    release     => 'precise',
    pin         => 200,
    include_src => false,
  }

  package { 'virtualbox-4.2':
    ensure  => present,
    require => Apt::Source['virtualbox'],
  }

  package { 'rubygems':
    ensure => present,
  }

  # assumes that rake is always required for vagrant testing environments
  # (it always is for me)
  package { 'rake':
    ensure => present,
  }

  package { 'vagrant':
    provider => gem,
    ensure   => present,
    require  => Package['virtualbox-4.2', 'rubygems']
  }

}
