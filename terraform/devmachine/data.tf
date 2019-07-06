data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_security_group" "ssh" {
  tags {
    "Name" = "SSHMaison"
  }
}

data "aws_ebs_volume" "home" {
  most_recent = true

  filter {
    name   = "volume-type"
    values = ["gp2"]
  }

  filter {
    name   = "tag:mountPoint"
    values = ["home"]
  }
}

data "aws_route53_zone" "myzone" {
  name = "${var.zoneName}"

  tags = {
    "Name" = "PublicZone"
  }
}
