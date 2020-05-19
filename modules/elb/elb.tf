resource "aws_elb" "this" {
  name            = var.name
  subnets         = var.subnets
  security_groups = var.security_groups
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  cross_zone_load_balancing   = var.cross_zone_load_balancing
  connection_draining         = var.connection_draining
  connection_draining_timeout = var.connection_draining_timeout
  tags = {
    Name = var.name
  }
}
