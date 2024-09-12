provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_db_instance" "example" {
  instance_class = "db.t2.micro"
  engine = "postgres"
  allocated_storage = 10
  db_name = "terraform-demo"
  username = "admin"

  password = var.db_password
}
