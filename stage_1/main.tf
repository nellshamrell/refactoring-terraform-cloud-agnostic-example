provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "${var.region}"
}

resource "aws_instance" "my-server" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  tags {
    Name = "supermarket-server"
  }
  key_name = "${var.key_name}"
}

resource "aws_ebs_volume" "my-ebs" {
  availability_zone = "${aws_instance.my-server.availability_zone}"
  size = 40
  tags {
    Name = "my-ebs"
  }
}

resource "aws_volume_attachment" "my-ebs-att" {
  device_name = "/dev/sdh"
  volume_id = "${aws_ebs_volume.my-ebs.id}"
  instance_id = "${aws_instance.my-server.id}"
}

resource "null_resource" "my-info" {
  provisioner "local-exec" {
    command = "echo Your instance at ${aws_instance.my-server.public_ip} is ready"
  }
}
