output "address" {
  value = aws_db_instance.example.address
  description = "The address of the database"
}

output "port" {
  value = aws_db_instance.example.port
  description = "The port of the database"
}
