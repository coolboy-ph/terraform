variable "instance_tags_names" {
  type = list
  default = ["nginx-server", "nginx-web-server-1", "nginx-web-server-2"]
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "prd_subnet-1" {
  type = string
  default = "10.0.1.0/24"
}

variable "prd_availability_zone" {
  type = string
  default = "us-east-1a"
}

variable "prd_server_private_ip" {
  type = list
  default = ["10.0.1.50", "10.0.1.51", "10.0.1.52"]
}

variable "ami_id" {
  type = string
  default = "ami-08d4ac5b634553e16"
}

variable "prd_instance_type" {
  type = string
  default = "t2.micro"
}

variable "domain_name" {
  type    = string
  default = "cool-learning.cf"
}

variable "www_domain_name" {
  type    = string
  default = "www.cool-learning.cf"
}