# Git Mastermind VPC
resource "aws_vpc" "Mastermind-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true


  tags = {
    Name        = "Mastermind-vpc"
    Environment = "Prod"
  }
}


# Public subnets
resource "aws_subnet" "Mastermind-sub1" {
  vpc_id            = aws_vpc.Mastermind-vpc.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "Mastermind-sub1"
  }
}
# mastermind subnet 2
resource "aws_subnet" "Mastermind_sub2" {
  vpc_id            = aws_vpc.Mastermind-vpc.id
  cidr_block        = "10.0.11.0/24"
  availability_zone = "eu-west-1b"

  tags = {
    Name        = "Mastermind_sub2"
    Environment = "Prod"
  }
}


# mastermind private rt
resource "aws_route_table" "mastermind_prv_rt" {
  vpc_id = aws_vpc.Mastermind-vpc.id

  tags = {
    Name        = "mastermind_prv_rt"
    Environment = "Prod"
  }
}

# Public Route Tables
resource "aws_route_table" "Mastermind-pub-route-table" {
  vpc_id = aws_vpc.Mastermind-vpc.id

  tags = {
    Name = "Mastermind-pub-route-table"
  }
}

# mastermind route table association
resource "aws_route_table_association" "private-rt-assoc" {
  subnet_id      = aws_subnet.Mastermind_sub2.id
  route_table_id = aws_route_table.mastermind_prv_rt.id
}


# Route Table Associations
resource "aws_route_table_association" "public-rt-assoc" {
  subnet_id      = aws_subnet.Mastermind-sub1.id
  route_table_id = aws_route_table.Mastermind-pub-route-table.id
}
