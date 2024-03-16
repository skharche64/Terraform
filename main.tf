resource "aws_instance" "myec2" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = "sam"
    subnet_id = aws_subnet.my_subnet.id
    vpc_security_group_ids = [aws_default_security_group.aws_default_security_group.id]
    availability_zone = var.availability_zone
    association_public_ip_address = true
    user_data = file("jenkins-server-script.sh")
    tags = {
        Name = "${var.env_prefix}-server"
    }
}