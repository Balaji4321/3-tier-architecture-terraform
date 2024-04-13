
resource "aws_vpc" "my-vpc" {
  cidr_block = var.my-vpc-cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "My-vpc"
  }
}