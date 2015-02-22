class mybase {
	$pkgs=['sudo','tmux','vim','git']
	package { $pkgs:
		ensure	=> 'present'
	}

	file { '/root/.bashrc':
		source => "puppet:///modules/mybase/bashrc"
	}
	
	file { '/etc/vim/vimrc':
		source => "puppet:///modules/mybase/vimrc"
	}
	
	file { '/etc/puppet/puppet.conf':
		source => "puppet:///modules/mybase/puppet.conf"		
	}

	file { '/home/li/.ssh/authorized_keys':
		source => "puppet:///modules/mybase/auth"		
	}
}
