resource "aws_ebs_volume" "home" {
  availability_zone = "us-west-2a"
  size              = 100
  type              = "gp2"

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    mountPoint = "home"
  }
}

resource "aws_key_pair" "user" {
  key_name   = "olwu-macbook"
  public_key = "${file("/Users/olivier.wulveryck/.ssh/id_rsa.pub")}"
}
