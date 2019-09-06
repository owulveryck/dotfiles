terraform {
  backend "s3" {
    bucket = "terraform-owulveryck"
    key    = "00_data"
    region = "us-east-1"
  }
}
