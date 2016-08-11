output "public_dns" {
  value = "${aws_instance.my-server.public_dns}"
}
