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
    cluster_nodes => ['192.168.50.11', '192.168.50.12'],
    cluster_node_type => 'disc',
}->
rabbitmq_user { 'adamc':
  admin    => true,
  password => 'guest',
}

exec { 'setup_ha_queue':
    command => "/usr/sbin/rabbitmqctl set_policy ha-all \"^ha\\.\" \'{\"ha-mode\":\"all\"}\'",
    unless  => "/usr/sbin/rabbitmqctl list_policies | grep ha-all",
    require => Class['rabbitmq']
}