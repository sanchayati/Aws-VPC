resource "aws_vpc" "my_vpc" {
  #cidr_block = "0.0.0.0/0"
  tags = {
    Name = "Default VPC"
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
}

resource "tls_private_key" "this" {
  algorithm     = "RSA"
}
resource "aws_key_pair" "this" {
  key_name      = "my-key"
  public_key    = tls_private_key.this.public_key_openssh

  provisioner "local-exec" {
    command = <<-EOT
      echo "${tls_private_key.this.private_key_pem}" > my-key.pem
    EOT
  }
}
resource "aws_instance" "foo" {
  ami           = "ami-0be656e75e69af1a9" 
  instance_type = "t2.micro"
}