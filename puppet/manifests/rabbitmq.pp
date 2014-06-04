class { 'rabbitmq':
  config_cluster    => true,
  cluster_nodes     => ['rabbit1', 'rabbit2'],
  cluster_node_type => 'ram',
  wipe_db_on_cookie_change => true
}

sudo ufw allow 5672