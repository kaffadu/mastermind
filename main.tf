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

# Public Route Tables
resource "aws_route_table" "Mastermind-pub-route-table" {
  vpc_id = aws_vpc.Mastermind-vpc.id

  tags = {
    Name = "Mastermind-pub-route-table"
  }
}


# Route Table Associations
resource "aws_route_table_association" "public-rt-assoc" {
  subnet_id      = aws_subnet.Mastermind-sub1.id
  route_table_id = aws_route_table.Mastermind-pub-route-table.id
}