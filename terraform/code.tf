provider "aws" {
    region = "ami-0be656e75e69af1a9"
}

resource "aws_instance" "Demo_EC2" {
    ami = "ami-0be656e75e69af1a9"
    instance_type = "t2.micro"
}