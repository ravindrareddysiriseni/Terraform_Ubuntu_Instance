resource "aws_vpc" "default" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name        = "${var.vpc_name}"
    Owner       = "Ravindra Reddy Siriseni"
    environment = "${var.environment}"
    Star1       = "Chiru"
    Star2       = "Mahesh"
    Star3       = "AllArjun"
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name = "${var.IGW_name}"
  }
}
