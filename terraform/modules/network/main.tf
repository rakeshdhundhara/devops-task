
# resource "aws_vpc" "main" {
#   cidr_block = "172.31.0.0/16"
#   tags       = var.tags
# }

# resource "aws_subnet" "public_subnets" {
#   count             = length(var.public_subnet_cidrs)
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = element(var.public_subnet_cidrs, count.index)
#   availability_zone = element(var.azs, count.index)
#   map_public_ip_on_launch = true
#   tags = merge(var.tags, { Name = "public-subnet-${count.index}" })
# }

# resource "aws_subnet" "private_subnets" {
#   count             = length(var.private_subnet_cidrs)
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = element(var.public_subnet_cidrs, count.index)
#   availability_zone = element(var.azs, count.index)
#   map_public_ip_on_launch = true
#   tags = merge(var.tags, { Name = "public-subnet-${count.index}" })
# }

# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.main.id
#   tags   = var.tags
# }

# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.main.id
#   tags   = var.tags
# }

# resource "aws_route" "default_route" {
#   route_table_id         = aws_route_table.public.id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = aws_internet_gateway.igw.id
# }

# resource "aws_route_table_association" "public_assoc" {
#   count          = length(aws_subnet.public_subnets)
#   subnet_id      = aws_subnet.public_subnets[count.index].id
#   route_table_id = aws_route_table.public.id
# }



resource "aws_vpc" "vpc_devops_task" {
  cidr_block           = "172.31.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = merge(var.tags, { Name = "demo-vpc" })
}

resource "aws_subnet" "public" {
  for_each = zipmap(var.azs, var.public_subnet_cidrs)

  vpc_id                  = aws_vpc.vpc_devops_task.id
  cidr_block              = each.value
  availability_zone       = each.key
  map_public_ip_on_launch = true

  tags = merge(var.tags, { Name = "public-${each.key}" })
}
