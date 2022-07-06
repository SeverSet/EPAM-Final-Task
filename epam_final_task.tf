provider "aws" {
  region     = "eu-central-1"
}

resource "aws_instance" "server" {
  ami = "ami-0c9354388bb36c088"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.server_SG.id]
  key_name = "EPAM-Task"
}

data "aws_eip" "my_instance_eip" {
  public_ip = "3.74.197.60"
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.server.id
  allocation_id = data.aws_eip.my_instance_eip.id
}

resource "aws_security_group" "server_SG" {
  dynamic "ingress" {
    for_each = ["22", "80", "443", "3306", "8080"]
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
 }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
 }
}

