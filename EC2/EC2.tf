module "vpc_main" {
  source = "../VPC"
  
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    # values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
    values = ["${var.AMI_NAME}"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

# public instance
resource "aws_instance" "public-instance" {
    ami           = "${data.aws_ami.ubuntu.id}"
    instance_type = "${var.instance_type}"
    # subnet_id = "${aws_subnet.public-subnet.id}"
    subnet_id = "${module.vpc_main.subnet-public}"
    # vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
    vpc_security_group_ids = ["${module.vpc_main.security-group}"]
    # key_name = "xyz"
    key_name = "${var.key_name}"
    user_data = "${file("EC2/install_psql.sh")}"

    tags = {
      Name = "kv-public-instance"
    }
}

# private instance
resource "aws_instance" "private-instance" {
    ami           = "${data.aws_ami.ubuntu.id}"
    instance_type = "${var.instance_type}"
    # subnet_id = "${aws_subnet.private-subnet.id}"
    subnet_id = "${module.vpc_main.subnet-private}"
    
    # vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
    vpc_security_group_ids = ["${module.vpc_main.security-group}"]
    # key_name = "xyz"
    key_name = "${var.key_name}"

    tags = {
      Name = "kv-private-instance"
    }
}
