terraform {
    backend "s3" {
        bucket = "my-bucket-3164"
        region = "us-east-1"
        key = "eks/terraform.tfstate"
    }
}