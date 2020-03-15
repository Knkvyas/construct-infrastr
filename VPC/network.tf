# module "ec2" {
#   source = "./EC2"
# }


# Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "kv-igw"
  }
}

# route Table

resource "aws_route_table" "private-route1" {
    vpc_id = "${aws_vpc.main.id}"
    tags = {
        Name = "kv-private-route"
    }
}


resource "aws_route_table" "public-route1" {
    vpc_id = "${aws_vpc.main.id}"
    route {
        //associated subnet can reach everywhere
        # cidr_block = "0.0.0.0/0" 
        cidr_block = "${var.igw_cidr_block}"
        //CRT uses this IGW to reach internet
        gateway_id = "${aws_internet_gateway.igw.id}" 
    }
    tags = {
        Name = "kv-public-route"
    }

}

# Route table association

resource "aws_route_table_association" "assoc-public-subnet"{
    subnet_id = "${aws_subnet.public-subnet.id}"
    route_table_id = "${aws_route_table.public-route1.id}"
}

resource "aws_route_table_association" "assoc-private-subnet"{
    subnet_id = "${aws_subnet.private-subnet.id}"
    route_table_id = "${aws_route_table.private-route1.id}"
}


# create security group
resource "aws_security_group" "ssh-allowed" {
    vpc_id = "${aws_vpc.main.id}"
    tags = {
        Name = "kv-ssh-allowed"
    }
}
