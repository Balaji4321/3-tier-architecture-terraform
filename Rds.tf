###########Database instance #############


resource "aws_db_instance" "db" {
  allocated_storage      = 10
  availability_zone      = "us-east-1b"
  db_subnet_group_name   = aws_db_subnet_group.db-subnet-group.id
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = var.db-instance-class
  multi_az               = var.multi-az-deployment
  db_name                = "sqldb" 
  username               = "username"
  password               = "password"
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.db-sg.id]
}

############ DB SUBNET GROUP ###############
resource "aws_db_subnet_group" "db-subnet-group" {
  name       = "database subnets"
  subnet_ids = [aws_subnet.db-prvt-subnet-1.id, aws_subnet.db-prvt-subnet-2.id]

  tags = {
    Name = "db-subnet-group"
  }
}