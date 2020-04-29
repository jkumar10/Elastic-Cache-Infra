resource "aws_security_group" "app-instance-grp" {
  vpc_id      = var.vpc_id
  name        = "myinstance"
  description = "security group for my instance"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.app-elb-securitygroup.id]
  }

  tags = {
    Name = "app-instance-grp"
  }
}

resource "aws_security_group" "app-elb-securitygroup" {
  vpc_id      = var.vpc_id
  name        = "app-elb-securitygroup"
  description = "security group for load balancer"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "app-elb-securitygroup"
  }
}

resource "aws_security_group" "redis-securitygroup" {
  vpc_id      = var.vpc_id
  name        = "redis-securitygroup"
  description = "security group for redis cluster"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = []
    security_groups= [aws_security_group.app-instance-grp.id]
  }
  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = []
    security_groups= [aws_security_group.app-instance-grp.id]
  }

  tags = {
    Name = "redis-securitygroup"
  }
}
