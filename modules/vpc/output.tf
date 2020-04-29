output "vpc_id" {
  description = "The ID of the VPC"
  value = aws_vpc.this.id
}

output "app-public-1" {
  description = "The ID of the subnet"
  value = aws_subnet.app-public-1.id
}

output "app-public-2" {
  description = "The ID of the subnet"
  value = aws_subnet.app-public-2.id
}

output "app-private-1" {
  description = "The ID of the subnet"
  value = aws_subnet.app-private-1.id
}
output "app-private-2" {
  description = "The ID of the subnet"
  value = aws_subnet.app-private-2.id
}
output "app-private-3" {
  description = "The ID of the subnet"
  value = aws_subnet.app-private-3.id
}
