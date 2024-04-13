######### ROUTE-TABLE-ASSOCIATIONS ##############

#########PUBLIC-ROUTE-TABLE-ASSOCIATION ###########

#ROUTE ASS FOR WEB-TIER

#Create Web Subnet association with Web route table

resource "aws_route_table_association" "pub-rta" {
  subnet_id      = aws_subnet.web-pub-subnet-1.id
  route_table_id = aws_route_table.web-pub-rt.id
}

resource "aws_route_table_association" "pub-rta" {
  subnet_id      = aws_subnet.web-pub-subnet-2.id
  route_table_id = aws_route_table.web-pub-rt.id
}


 ########## PRIVATE-ROUTE-TABLE-ASSOCIATION #############

#ROUTE ASS FOR APP-TIER

resource "aws_route_table_association" "nat-route-1" {
  subnet_id      = aws_subnet.app-prvt-subnet-1.id
  route_table_id = aws_route_table.prvt-rt.id
}

resource "aws_route_table_association" "nat-route-2" {
  subnet_id      = aws_subnet.app-prvt-subnet-2.id
  route_table_id = aws_route_table.prvt-rt.id
}


#ROUTE ASS FOR DB-TIER

resource "aws_route_table_association" "nat-route-db-1" {
  subnet_id      = aws_subnet.db-prvt-subnet-1.id
  route_table_id = aws_route_table.prvt-rt.id
}

resource "aws_route_table_association" "nat-route-db-2" {
  subnet_id      = aws_subnet.db-prvt-subnet-2.id
  route_table_id = aws_route_table.prvt-rt.id
}