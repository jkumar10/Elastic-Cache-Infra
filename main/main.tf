module "vpcmodule" {
  source = "../modules/vpc"
  name = "aws-app"
  cidr = "10.0.0.0/16"
  cidr-public-1 = "10.0.1.0/24"
  cidr-public-2 = "10.0.2.0/24"
  cidr-private-1 = "10.0.3.0/24"
  cidr-private-2 = "10.0.4.0/24"
  cidr-private-3 = "10.0.5.0/24"

}

module "securitygroup" {
  source = "../modules/securitygroup"
  vpc_id = module.vpcmodule.vpc_id
}

module "elbmodule" {
  source = "../modules/elb"
  name = "app-elb"
  subnets = [module.vpcmodule.app-public-1, module.vpcmodule.app-public-2]
  security_groups = [module.securitygroup.app-elb-securitygroup]
  cross_zone_load_balancing   = true
  connection_draining         = false
  connection_draining_timeout = 400

}

module "autoscaling" {
  source = "../modules/autoscaling"
  image_id = "ami-07ebfd5b3428b6f4d"
  instance_type = "t2.micro"
  security_groups = [module.securitygroup.app-instance-grp]
  user_data = "#!/bin/bash\napt-get update\napt-get -y install nginx\nMYIP=`ifconfig | grep 'addr:10' | awk '{ print $2 }' | cut -d ':' -f2`\necho 'this is: '$MYIP > /var/www/html/index.html"
  vpc_zone_identifier = [module.vpcmodule.app-private-1, module.vpcmodule.app-private-2]
  min_size                  = 2
  max_size                  = 4
  health_check_grace_period = 300
  health_check_type         = "ELB"
  load_balancers = [module.elbmodule.app-elb]
  force_delete              = true
}


module "redis" {
  source = "../modules/redis"

  name_prefix           = "core-example"
  number_cache_clusters = 1
  node_type             = "cache.t2.micro"

  engine_version           = "5.0.6"
  port                     = 6379
  maintenance_window       = "mon:03:00-mon:04:00"
  snapshot_window          = "04:00-06:00"
  snapshot_retention_limit = 7

  automatic_failover_enabled = true

  at_rest_encryption_enabled = true
  transit_encryption_enabled = true
  auth_token                 = "1234567890asdfghjkl"

  apply_immediately = true
  family            = "redis5.0"
  description       = "Test elasticache redis."

  subnet_ids = [module.vpcmodule.app-private-1, module.vpcmodule.app-private-2]
  vpc_id     = module.vpcmodule.vpc_id
  security_group_ids   = [module.securitygroup.redis-securitygroup]

  ingress_cidr_blocks = ["0.0.0.0/0"]

  parameter = [
    {
      name  = "repl-backlog-size"
      value = "16384"
    }
  ]

  tags = {
    Project = "Test"
  }
}
