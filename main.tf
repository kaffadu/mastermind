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


# mastermind subnet 2
resource "aws_subnet" "Mastermind_sub2" {
  vpc_id     = aws_vpc.Mastermind-vpc.id
  cidr_block = "10.0.11.0/24"
  availability_zone = "eu-west-1b"

  tags = {
    Name        = "Mastermind_sub2"
    Environment = "Prod"
  }
}