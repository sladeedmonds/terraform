data "aws_ami" "gp01" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-20191113"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
} 

resource "aws_instance" "gp01" {
  ami           = data.aws_ami.gp01.id
  instance_type = "t2.micro"

  tags = {
    Name = "acg-ubuntu"
  }

  vpc_security_group_ids = [
      aws_security_group.security_group_gp01.id
  ]
}