variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}
variable "amis" {
  description = "AMIs by region"
  default = {
    us-east-1 = "ami-0ecb62995f68bb549" # ubuntu 14.04 LTS
    us-east-2 = "ami-0c398cb65a93047f2" # ubuntu 14.04 LTS
  }
}
variable "vpc_cidr" {}
variable "vpc_name" {}
variable "IGW_name" {}
variable "key_name" {}
variable "public_subnet1_cidr" {}
variable "public_subnet2_cidr" {}
variable "public_subnet3_cidr" {}
variable "public_subnet1_name" {}
variable "public_subnet2_name" {}
variable "public_subnet3_name" {}
variable "Main_Routing_Table" {}
variable "azs" {
  description = "Run the EC2 Instances in these Availability Zones"
  default     = ["us-east-1a", "us-east-1b"]
}
variable "environment" { default = "dev" }
variable "instance_type" {
  default = {
    dev  = "t3.micro"
    test = "t3.small"
    prod = "t2.medium"

  }
}

