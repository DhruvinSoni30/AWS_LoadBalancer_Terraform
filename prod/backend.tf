terraform {
  backend "s3" {
    bucket  = "dhsoni-terraform"
    key     = "terraform.tfstate"
    region  = "us-east-2"
    profile = "default"
  }
}