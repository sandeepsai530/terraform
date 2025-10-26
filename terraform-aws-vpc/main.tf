resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = var.enable_dns_hostnames

  #expense-dev
  tags = merge(
    var.common_tags,
    var.vpc_tags, 
    {
        Name= local.resource_name
    }
  )
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id 

  tags = merge(
    var.common_tags,
    var.igw_tags, 
    {
        Name = local.resource_name
  }
  )
}

#expense-dev-public-us-east-1a/1b
resource "aws_subnet" "public_subnet" {
    count = length(var.public_subnet_cidr)
    vpc_id     = aws_vpc.main.id
    cidr_block = var.public_subnet_cidr[count.index]
    availability_zone = local.az_names[count.index]
    map_public_ip_on_launch = true

  tags = merge(
    var.common_tags,
    var.public_subnet_tags,{
    Name = "${local.resource_name}-public-${local.az_names[count.index]}"
  }
  )
}

#expense-dev-private-us-east-1a/1b
resource "aws_subnet" "private_subnet" {
    count = length(var.private_subnet_cidr)
    vpc_id     = aws_vpc.main.id
    cidr_block = var.private_subnet_cidr[count.index]
    availability_zone = local.az_names[count.index]
    map_public_ip_on_launch = true

  tags = merge(
    var.common_tags,
    var.private_subnet_tags,{
    Name = "${local.resource_name}-private-${local.az_names[count.index]}"
  }
  )
}

#expense-dev-database-us-east-1a/1b
resource "aws_subnet" "database_subnet" {
    count = length(var.database_subnet_cidr)
    vpc_id     = aws_vpc.main.id
    cidr_block = var.database_subnet_cidr[count.index]
    availability_zone = local.az_names[count.index]
    map_public_ip_on_launch = true

  tags = merge(
    var.common_tags,
    var.database_subnet_tags,{
    Name = "${local.resource_name}-database-${local.az_names[count.index]}"
  }
  )
}

resource "aws_eip" "nat" {
    domain = "vpc"
}

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.nat.id
  subnet_id = aws_subnet.public_subnet[0].id
  depends_on = [ aws_internet_gateway.main ]

    tags = merge(
        var.common_tags,
        var.nat_tags, {
            Name = local.resource_name
        }
    )
} 

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  tags = merge (
    var.common_tags,
    var.public_rt_tags, {
        Name = "${local.resource_name}-public"
    }
  )
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  tags = merge (
    var.common_tags,
    var.private_rt_tags, {
        Name = "${local.resource_name}-private"
    }
  )
}

resource "aws_route_table" "database_rt" {
  vpc_id = aws_vpc.main.id

  tags = merge (
    var.common_tags,
    var.database_rt_tags, {
        Name = "${local.resource_name}-database"
    }
  )
}

resource "aws_route" "public" {
  route_table_id = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.main.id
}

resource "aws_route" "private" {
  route_table_id = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.example.id
}

resource "aws_route" "database" {
  route_table_id = aws_route_table.database_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.example.id
}

 resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_cidr)
  subnet_id = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private" {
  count = length(var.private_subnet_cidr)
  subnet_id = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "database" {
  count = length(var.database_subnet_cidr)
  subnet_id = aws_subnet.database_subnet[count.index].id
  route_table_id = aws_route_table.database_rt.id
} 