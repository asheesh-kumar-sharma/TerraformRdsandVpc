terraform {
  backend "s3" {
    bucket = "virtega-terraform-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-locks"
  }
}