terraform {
  backend "s3" {
    bucket = "terraform-backend-jk"
    key    = "homework.tfstate"
    region = "us-east-1"
  }
}
