#This Terraform Code Deploys Basic VPC Infra.
provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

terraform {
  required_version = "1.13.4" #Forcing which version of Terraform needs to be used
  required_providers {
    aws = {
      version = "<= 6.19.0" #Forcing which version of plugin needs to be used.
      source  = "hashicorp/aws"
    }
  }
}








data "aws_ami" "my_ami" {
  most_recent = true
  #name_regex       = "^mavrick"
  owners = ["212020517509"] # Canonical AWS Account ID
}


resource "aws_instance" "ubuntu" {
  # ami = var.imagename
  ami = "ami-0ecb62995f68bb549"
  #ami = "${data.aws_ami.my_ami.id}"
  availability_zone           = "us-east-1a"
  instance_type               = "t3.micro"
  key_name                    = "NewKey"
  subnet_id                   = aws_subnet.subnet1-public.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "Ubuntu Server created from Terraform"
    Env        = "Dev"
    Owner      = "Ravindra Reddy Siriseni"
    CostCenter = "ABCD"
  }
}

resource "aws_instance" "ubuntu_server" {
  ami                         = "ami-0c398cb65a93047f2"
  availability_zone           = "us-east-1b"
  instance_type               = "t3.micro"
  key_name                    = "NewKey"
  subnet_id                   = aws_subnet.subnet2-public.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "Terraform_Server"
    Env        = "Dev"
    Owner      = "Ravindra Reddy Siriseni"
    CostCenter = "ABCD"
  }
}

##output "ami_id" {
#  value = "${data.aws_ami.my_ami.id}"
#}
#!/bin/bash
# echo "Listing the files in the repo."
# ls -al
# echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++"
# echo "Running Packer Now...!!"
# packer build -var=aws_access_key=AAAAAAAAAAAAAAAAAA -var=aws_secret_key=BBBBBBBBBBBBB packer.json
#packer validate --var-file creds.json packer.json
#packer build --var-file creds.json packer.json
#packer.exe build --var-file creds.json -var=aws_access_key=AAAAAAAAAAAAAAAAAA -var=aws_secret_key=BBBBBBBBBBBBB packer.json
# echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++"
# echo "Running Terraform Now...!!"
# terraform init
# terraform apply --var-file terraform.tfvars -var="aws_access_key=AAAAAAAAAAAAAAAAAA" -var="aws_secret_key=BBBBBBBBBBBBB" --auto-approve
#https://discuss.devopscube.com/t/how-to-get-the-ami-id-after-a-packer-build/36
