resource "aws_instance" "aps1" {
  provider      = aws.aps-1
  ami           = data.aws_ami.ubuntu_aps1.id
  instance_type = "t3.small"
    tags = {
    Name = "Web-Server-APS-1"
  }
  
  user_data = var.install-nginx
  key_name = "WebServer-aps-1"

}

resource "aws_instance" "aps2" {
  provider      = aws.aps-2
  ami           = data.aws_ami.ubuntu_aps2.id
  instance_type = "t3.small"
  tags = {
    Name = "Web-Server-APS-2"
  }

   user_data = var.install-nginx
   key_name = "WebServer-aps-2"

}
