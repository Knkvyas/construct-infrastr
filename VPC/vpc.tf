
resource "aws_vpc" "main" {
  # cidr_block       = "10.0.0.0/16"
  cidr_block = "${var.VPC_CIDR_BLOCK}"
  instance_tenancy = "${var.INSTANCE_TENANCY}"
  enable_dns_hostnames = true

  tags = {
    Name = "kv-vpc"
  }
}


# Subnets
resource "aws_subnet" "private-subnet" {
  vpc_id     = "${aws_vpc.main.id}"
  # cidr_block = "10.0.41.0/24"
  cidr_block = "${var.private_subnet_cidr_block}"
  # map_public_ip_on_launch = false
  map_public_ip_on_launch = "${var.public_ip_false}"
  # availability_zone = "ap-southeast-1b"
  availability_zone = "${var.available_zone}"

  tags = {
    Name = "kv-private-sub"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id     = "${aws_vpc.main.id}"
  # cidr_block = "10.0.42.0/24"
  cidr_block = "${var.public_subnet_cidr_block}"
  # map_public_ip_on_launch = true
  map_public_ip_on_launch = true
  # availability_zone = "ap-southeast-1b"
  availability_zone = "${var.available_zone}"
  tags = {
    Name = "kv-public-sub"
  }
}


