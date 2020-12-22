resource "aws_security_group" "security_group_gp01" {
  name        = "acg-ubuntu"
  description = "Rules for general purpose ec2"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_default_vpc.default.cidr_block]
  }

  ingress {
      description = "MQQT from Slade home"
      from_port = 1883
      to_port = 1883
      protocol = "tcp"
      cidr_blocks = [var.slade_home_ip]
  }

  ingress {
      description = "SSH from Slade home"
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = [var.slade_home_ip]
  }

  ingress {
      description = "SSH from St Simons"
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = [var.vacation_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}