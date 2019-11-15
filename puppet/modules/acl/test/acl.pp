acl {"myacl":
    path => '/home/qiuj/hello_',
    mode => '775',
    owner => 'jianl',
    group => 'jianl',
    ensure => present
}
