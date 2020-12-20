terraform {
  backend "s3" {
    bucket = "tfstate-acg"
    key    = "acg.tfstate"
    region = "us-east-1"
  }
}
