provider "aws" {
  region     = "eu-central-1"
}

resource "aws_instance" "server" {
  ami = "ami-0c9354388bb36c088"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.server_SG.id]
  key_name = "EPAM-Task"
}

resource "aws_security_group" "server_SG" {
  egress {
    cidr_blocks = ["0.0.0.0/0", ]
    description = ""
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0", ]
    description = ""
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0", ]
    description = ""
    from_port   = 8080
    protocol    = "tcp"
    to_port     = 8080
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0", ]
  }
}
