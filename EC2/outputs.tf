output "private_ins" {
  value = "${aws_instance.private-instance.id}"
}

output "public_ins" {
  value = "${aws_instance.public-instance.id}"
}