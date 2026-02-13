terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.31.0"
    }
  }
}

provider "aws" {
  alias  = "aps-1"
  region = "ap-south-1"
}

provider "aws" {
  alias  = "aps-2"
  region = "ap-south-2"
}

data "aws_ami" "ubuntu_aps1" {
  provider    = aws.aps-1
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"] 
  }
  owners = ["099720109477"] # Canonical's Owner ID
}

data "aws_ami" "ubuntu_aps2" {
  provider    = aws.aps-2
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  owners = ["099720109477"] # Canonical's Owner ID
}

resource "aws_instance" "aps1" {
  provider      = aws.aps-1
  ami           = data.aws_ami.ubuntu_aps1.id
  instance_type = "t3.small"
    tags = {
    Name = "AP-South-1-Instance"
  }
}

resource "aws_instance" "aps2" {
  provider      = aws.aps-2
  ami           = data.aws_ami.ubuntu_aps2.id
  instance_type = "t3.small"
  tags = {
    Name = "AP-South-2-Instance"
  }
}