output "alb_dns_name" {
  value = aws_lb.example.dns_name
  description = "The domain of the load balancer"
}
