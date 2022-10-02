provider "aws" {
  region = var.region
}

data "aws_ami" "amazonlinux" {
  most_recent = true

  filter {
    name   = "architecture"
    values = ["arm64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-*"]
  }

  owners = ["137112412989"] # Amazon
}

resource "aws_instance" "amazonlinux" {
  ami           = data.aws_ami.amazonlinux.id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}
