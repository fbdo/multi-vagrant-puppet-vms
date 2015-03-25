node default {
# Test message
  notify { "Debug output on ${hostname} node.": }

  include ntp, git
}

node 'puppet.example.com' {
  include ntp, git, docker, jenkins

  jenkins::plugin { 'git': }
  jenkins::plugin { 'delivery-pipeline-plugin': }
  jenkins::plugin { 'copyartifact': }
  jenkins::plugin { 'shared-workspace': }
  jenkins::plugin { 'dynamicparameter': }

  class { "maven::maven":
    version => "3.2.1"
  }

  class { 'sonarqube' :
    version => '3.7.4',
  }

}

node 'node01.example.com', 'node02.example.com' {
# Test message
  notify { "Debug output on ${hostname} node.": }

  include ntp, git, docker
}
