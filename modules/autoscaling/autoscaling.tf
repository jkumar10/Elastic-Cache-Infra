resource "aws_launch_configuration" "app-launchconfig" {
  name_prefix     = "app-launchconfig"
  image_id        = var.image_id
  instance_type   = var.instance_type
  security_groups = var.security_groups
  user_data       = var.user_data
  }

resource "aws_autoscaling_group" "app-autoscaling" {
  name                      = "app-autoscaling"
  vpc_zone_identifier       = var.vpc_zone_identifier
  launch_configuration      = aws_launch_configuration.app-launchconfig.name
  min_size                  = var.min_size
  max_size                  = var.max_size
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  load_balancers            = var.load_balancers
  force_delete              = var.force_delete

  tag {
    key                 = "Name"
    value               = "app instance"
    propagate_at_launch = true
  }
}
