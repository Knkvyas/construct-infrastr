variable "AWS_REGION" {    
    default = "ap-southeast-1"
}

variable "AMI" {
    type = "map"
    
    default = {
        ap-southeast-1 = "ami-09a4a9ce71ff3f20b"
    }
}

variable "PUBLIC_KEY_PATH" {
default = "/home/kanak_vyas/Documents/kanak.pem"
}

variable "VPC_CIDR_BLOCK" {
    default = "10.0.0.0/16"
  
}

variable "INSTANCE_TENANCY" {
  default =  "dedicated"
}

variable "private_subnet_cidr_block" {
  default = "10.0.41.0/24"
}
variable "public_subnet_cidr_block" {
  default = "10.0.42.0/24"
}

variable "public_ip_false" {
    default=false
  
}
variable "public_ip_true" {
    default="true"
  
}


variable "available_zone" {
  default = "ap-southeast-1b"
}

variable "igw_cidr_block" {
    default = "0.0.0.0/0" 
  
}


variable "out_bound" {
  default = "0.0.0.0/0"
}


variable "myip" {
  default = "125.99.249.250/32"
}

variable "protocol_type" {
  default ="tcp"
}
