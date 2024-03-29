resource "aws_vpc" "my_vpc" {
    cidr_block = var.cidr_block
    tags = {
        Name = "${var.env_prefix}-vpc"
    }
}

resource "aws_subnet" "my_subnet" {
    vpc_id  = aws.vpc.my_vpc.id
    cidr_block = var.subnet_cidr_block
    availability_zone = var.availability_zone
    tags = {
        Name = "${var.env_prefix}-subnet-1"
    }

resource "aws_internet_gateway" "my_igw" {
    vpc_id = var.aws_vpc.my_vpc.id
    tags = {
        Name = "${$var.env_prefix}-igw"
    }
}

resource "aws_default_route_table" "main-rtb" {
    aws_default_route_table_id = aws.vpc.my_vpc.aws_default_route_table_id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_igw.id
    }
    tags = {
        Name = "{$var.env_prefix}-main-rtb"
    }
}

resource "aws_default_security_group" "default-sg" {
    vpc_id = aws_vpc.my_vpc.id
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_block = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_block = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_block = ["0.0.0.0/0"]
    }
    tags = {
        Name ="${var.env_prefix}-default-sg"
    }
}
}