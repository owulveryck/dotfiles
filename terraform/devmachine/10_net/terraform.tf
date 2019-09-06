terraform {
  backend "s3" {
    bucket = "terraform-owulveryck"
    key    = "10_net"
    region = "us-east-1"
  }
}
