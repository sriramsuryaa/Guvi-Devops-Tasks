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

variable "install-nginx" {
  description = "Installing Nginx on ubuntu"
  type = string
  default = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install nginx -y
              sudo systemctl enable nginx 
              sudo systemctl start nginx
              EOF
}
