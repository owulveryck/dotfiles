resource "aws_instance" "dev" {
  ami               = var.gpu ? data.aws_ami.dlami_ubuntu.id : data.aws_ami.ubuntu.id
  instance_type     = var.gpu ? var.gpu_instance_type : var.instance_type
  key_name          = var.keyName
  availability_zone = "us-east-1d"
  user_data         = file("postInstall.sh")

  tags = {
    Name = "dev"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name  = "/dev/sdh"
  volume_id    = data.aws_ebs_volume.home.id
  instance_id  = aws_instance.dev.id
  skip_destroy = true
}

resource "aws_route53_record" "dev" {
  zone_id = data.aws_route53_zone.myzone.zone_id
  name    = local.hostname
  type    = "A"
  ttl     = "300"
  records = [aws_instance.dev.public_ip]
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = data.aws_security_group.ssh.id
  network_interface_id = aws_instance.dev.primary_network_interface_id
}

