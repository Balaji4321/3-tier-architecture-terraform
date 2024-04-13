output "ib_dns_name" {
  description = "DNS Name of load balancer"
  value = "${aws_lb.app-load-balance.dns_name}"
}

