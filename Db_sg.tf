# Create Database Security Group  

resource "aws_security_group" "db-sg" {
  name        = "DB-SG"
  description = "Enable MYSQL access on port 3306"
  vpc_id      = aws_vpc.my-vpc.id

  ingress {
    description     = "MYSQL access"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = ["${aws_security_group.web-server-sg.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "DB-SG"
  }
}

