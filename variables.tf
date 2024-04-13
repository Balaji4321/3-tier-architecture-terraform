# vpc cidr block

variable "my-vpc-cidr" {
  default     = "10.0.0.0/16"
  description = "VPC_cidr_block"
  type        = string
}


#presentation tier cidr block 1

variable "web-pub-subnet-1-cidr" {
  default     = "10.0.1.0/24"
  description = "public_web_subnet_1"
  type        = string
}

#presentation tier cidr block 2

variable "web-pub-subnet-2-cidr" {
  default     = "10.0.2.0/24"
  description = "public_web_subnet_2"
  type        = string
}

#application tier cidr block 1

variable "app-prvt-subnet-1-cidr" {
  default     = "10.0.3.0/24"
  description = "private_app_subnet_1"
  type        = string
}

#application tier cidr block 2

variable "app-prvt-subnet-2-cidr" {
  default     = "10.0.4.0/24"
  description = "private_app_subnet_2"
  type        = string
}



#database tier cidr block 1

variable "db-prvt-subnet-1-cidr" {
  default     = "10.0.5.0/24"
  description = "private_db_subnet_1"
  type        = string
}

#database tier cidr block 2

variable "db-prvt-subnet-2-cidr" {
  default     = "10.0.6.0/24"
  description = "private_db_subnet_2"
  type        = string
}


#application tier security group

variable "ssh-locate" {
  default     = "your_ip_address"
  description = "ip address"
  type        = string
}



#  DB instance

variable "db-instance-class" {
  default     = "db.t2.micro"
  description = "the database instance type"
  type        = string
}



#  Multi_AZ

variable "multi-az-deployment" {
  default     = true
  description = "create a standby DB Instance"
  type        = bool
}

