variable "ami" {
    default = "ami-080e1f13689e07408"
}

variable "instance_type" {
    default = "t2.micro"
}
variable "vpc_id" {
    default = "vpc-03cb8c0f312e49ae3"
}

variable "vpc_cidr_block" {}
variable "subnet_cidr_block" {}
variable "availability_zone" {}
variable "env_prefix" {}