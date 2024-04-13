#################SUBNETES####################

######################PUBLIC-SUBNET##############

# CREATE WEB IN PUBLIC-SUBNET

resource "aws_subnet" "web-pub-subnet-1" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = var.web-pub-subnet-1-cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Web-pub-sub-1"
  }
}

resource "aws_subnet" "web-pub-subnet-2" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = var.web-pub-subnet-2-cidr
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Web-pub-sub-2"
  }
}

 ####################PRAVITE-SUBNET######################33


#CREATE APP IN PRIVATE-SUBNET

resource "aws_subnet" "app-prvt-subnet-1" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = var.app-prvt-subnet-1-cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "App-prvt-subnet-1" 
  }
}

resource "aws_subnet" "app-prvt-subnet-2" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = var.app-prvt-subnet-2-cidr
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "App-prvt-subnet-2" 
  }
}

#CREATE DB IN PRIVATE-SUBNET

resource "aws_subnet" "db-prvt-subnet-1" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.db-prvt-subnet-1-cidr
  availability_zone = "us-east-1"

  tags = {
    Name = "db-prvt-subnet-1"
  }
}

resource "aws_subnet" "db-prvt-subnet-2" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.db-prvt-subnet-2-cidr
  availability_zone = "us-east-1"

  tags = {
    Name = "db-prvt-subnet-2"
  }
}

