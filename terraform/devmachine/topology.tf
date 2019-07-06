provider "aws" {
  region = "us-east-1"
}

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

resource "aws_instance" "dev" {
  ami               = "${data.aws_ami.ubuntu.id}"
  instance_type     = "t2.micro"
  key_name          = "${var.keyName}"
  availability_zone = "us-east-1d"
  user_data         = "${file("postInstall.sh")}"

  tags = {
    Name = "Dev"
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

resource "aws_volume_attachment" "ebs_att" {
  device_name  = "/dev/sdh"
  volume_id    = "${data.aws_ebs_volume.home.id}"
  instance_id  = "${aws_instance.dev.id}"
  skip_destroy = true
}

data "aws_route53_zone" "myzone" {
  name = "${var.zoneName}"

  tags = {
    "Name" = "PublicZone"
  }
}

resource "aws_route53_record" "dev" {
  zone_id = "${data.aws_route53_zone.myzone.zone_id}"
  name    = "${local.hostname}"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.dev.public_ip}"]
}

output "instance_ip_addr" {
  value = "${aws_instance.dev.public_ip}"
}

data "aws_security_group" "ssh" {
  tags {
    "Name" = "SSHMaison"
  }
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = "${data.aws_security_group.ssh.id}"
  network_interface_id = "${aws_instance.dev.primary_network_interface_id}"
}
