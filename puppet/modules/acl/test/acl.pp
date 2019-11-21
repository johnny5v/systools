class mytest{
	tag 'hello'
	$allpaths = lookup('acl::allpaths')

	$allpaths.each |Hash $path|{
		hfile { $path['path']:
			ensure => present
		}
		->
		acl {$path['path']:
		    # mode => $path['mode'],
		    owner => $path['owner'],
		    group => $path['group'],
		    # ensure => present
		}	
	}

}

