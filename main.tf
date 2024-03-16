resource "aws_instance" "myec2" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = "sam"
}

resource "aws_security_group" "sg" {
    name = "aws_security_group"
    description = "Allow SSH Connection"
    vpc_id = var.vpc_id
   // vpc_id = "vpc-03cb8c0f312e49ae3"

    ingress {
        description = "SSH Connection"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = null
        prefix_list_ids = null
        security_groups = null
        self = null
        }

    egress {
        description = "SSH connection"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
}