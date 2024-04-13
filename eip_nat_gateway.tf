########## NAT-GATEWAY ############


resource "aws_eip" "lb" {
  domain   = "vpc"
}
   
   


resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip-nat.id
  subnet_id     = aws_subnet.web-pub-subnet-1.id

  tags = {
    Name = "nat"
  }
}
