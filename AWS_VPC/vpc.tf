resource "aws_vpc" "vpc-01" {
    cidr_block = var.vpc_cidr
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
      Name=random_pet.pavan_pet.id
    }
}



resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.vpc-01.id
    cidr_block = var.public_cidr
    availability_zone = var.public_availablity_zone
    tags = {
      Name="public-${random_pet.pavan_pet.id}"
    }
}

resource "aws_route_table_association" "public_rt_assoc" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_rt.id
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.vpc-01.id
    cidr_block = var.private_cidr
    availability_zone = var.private_availablity_zone
    tags = {
      Name="private-${random_pet.pavan_pet.id}"
    }
  
}

