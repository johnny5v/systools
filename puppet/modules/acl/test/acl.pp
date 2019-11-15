
acl {"myacl":
    path => lookup('acl::path'),
    mode => '775',
    owner => 'jianl',
    group => 'jianl',
    ensure => present
}
