resource "aws_vpc" "my_vpc" {
  cidr_block = "0.0.0.0/0"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.my_vpc.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.my_vpc.ipv6_cidr_block]
  }

resource "aws_instance" "foo" {
  ami           = "ami-0be656e75e69af1a9" 
  instance_type = "t2.micro"
  owner = ["masters-of-destruction"]

}