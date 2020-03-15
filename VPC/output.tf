output "subnet-private" {
  value = "${aws_subnet.private-subnet.id}"
}

output "subnet-public" {
  value = "${aws_subnet.public-subnet.id}"
}

output "security-group" {
  value = "${aws_security_group.ssh-allowed.id}"
}



