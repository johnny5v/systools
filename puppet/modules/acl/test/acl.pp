$allpaths = lookup('acl::allpaths')

$allpaths.each |Hash $path|{
	hfile { $path['path']:}
	->
	acl {$path['path']:
	    # mode => $path['mode'],
	    owner => $path['owner'],
	    group => $path['group'],
	    # ensure => present
	}	
}
