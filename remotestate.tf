terraform {
  backend "s3" {
    bucket = "raviterraformbucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }

}
