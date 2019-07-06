terraform {
  backend "s3" {
    bucket = "terraform-owulveryck"
    key    = "dev/machine"
    region = "us-east-1"
  }
}
