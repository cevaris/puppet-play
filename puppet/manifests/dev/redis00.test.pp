node 'redis00.test' {

    # $customer               = 'internal'
    # $deploy_environment     = 'test'
    # $program                = 'simpleenergy'
    # $location               = 'dev'

    # include role::puppet_master


	include base_system
	include redis


}

