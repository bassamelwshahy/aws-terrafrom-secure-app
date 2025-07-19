terraform {
  backend "s3" {
    bucket         = "bassamelwshahy-bucket"
    key            = "webapp/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}