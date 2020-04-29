output "app-elb-securitygroup" {
  description = "The ID of the security group"
  value = aws_security_group.app-elb-securitygroup.id
}

output "app-instance-grp" {
  description = "The ID of the security group"
  value = aws_security_group.app-instance-grp.id
}

output "redis-securitygroup" {
  description = "The ID of the security group"
  value = aws_security_group.redis-securitygroup.id
}
