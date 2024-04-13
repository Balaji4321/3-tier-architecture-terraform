################ ROUTE-TABLES ###############

###########PUBIC-ROUTE-TABLE ################

#CREATE ROUTE TABLE FOR WEB

resource "aws_route_table" "web-pub-rt" {
  vpc_id = aws_vpc.my-vpc.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "web-pub-rt"
  }
}

########## PRIVATE-ROUTETABLE ################

resource "aws_route_table" "prvt-rt" {
  vpc_id = aws_vpc.my-vpc.id


  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "prvt-rt"
  }
}