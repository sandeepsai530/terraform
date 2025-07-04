/* output "azs_info" {
  value = data.aws_availability_zones.available.names
}

output "subnets_info" {
  value = aws_subnet.public_subnet
} */

output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnet[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private_subnet[*].id
}

output "database_subnet_ids" {
  value = aws_subnet.database_subnet[*].id
}