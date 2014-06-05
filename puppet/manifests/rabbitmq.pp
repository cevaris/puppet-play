# class { 'rabbitmq':
#   	config_cluster    => true,
#   	cluster_nodes     => ['rabbit1', 'rabbit2'],
#   	cluster_node_type => 'ram',
#   	wipe_db_on_cookie_change => true,
#   	delete_guest_user => true,
# }
class { '::rabbitmq':
	# service_manage => false,
    delete_guest_user => true,
    admin_enable => true,
    erlang_cookie => 'ThisIsAStupidLongCookieThatShouldBeInHiera',
    ## This is used on the inital setup of the cookie. it WILL wipe the DB if the cookie changes
    wipe_db_on_cookie_change => true,
    config_cluster => true,
    ## Hiera lookup for the nodes in this cluster
    cluster_nodes => ['rabbit1', 'rabbit2'],
    cluster_node_type => 'disc',
}

$rmq_admin = 'adamc'

rabbitmq_user { 'adamc':
  admin    => true,
  password => 'guest',
  require =>  Package [ 'rabbitmq-server' ],
}



$default_vhost = '/'
rabbitmq_vhost { "$default_vhost":
  	ensure => present,
}

rabbitmq_user_permissions { "$rmq_admin@$default_vhost":
	configure_permission => '.*',
	read_permission      => '.*',
	write_permission     => '.*',
	require 			 => [Rabbitmq_Vhost[ $default_vhost ], Rabbitmq_User[ $rmq_admin ]]
	unless  			 => "/usr/sbin/rabbitmqctl list_permissions | grep -c '$rmq_admin.*.*.*'",
}

# exec { "setup_vhost_$rmq_admin":
# 	command => "/usr/sbin/rabbitmqctl set_permissions -p / $rmq_admin \".*\" \".*\" \".*\"",
# 	unless  => "/usr/sbin/rabbitmqctl list_permissions | grep -c '$rmq_admin.*.*.*'",
# 	require => Rabbitmq_User[ $rmq_admin ],
# 	user    => root,
# }


# rabbitmq_user { 'billy':
#   password => 'guest',
#   require =>  Package [ 'rabbitmq-server' ],
# }
# $uzer = 'billy'
# exec { "setup_vhost_$uzer":
#     command => "/usr/sbin/rabbitmqctl set_permissions -p / $uzer \".*\" \".*\" \".*\"",
#     require =>  Rabbitmq_user [ $uzer ],
#     user => root,
# }