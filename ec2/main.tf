provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0fed0634ee3607ed9"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-instance"
  }
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = file("helloWorld.sh")
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port = var.server_port
    to_port   = var.server_port
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "server_port" {
  description = "The port"
  type = number
  default = 8080
}

output "public_ip" {
  value = aws_instance.example.public_ip
  description = "The public IP of the web server"
}
