terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.21.0"
    }
  }
}

provider "aws" {
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "default"
}

# 1. Create Ubuntu server and install/enable nginx

resource "aws_instance" "web-server-instance-" {
  ami               = var.ami_id
  instance_type     = var.prd_instance_type
  availability_zone = var.prd_availability_zone

  private_ip        = var.prd_server_private_ip[count.index]
  vpc_security_group_ids = [aws_security_group.allow_web.id]
  subnet_id              = aws_subnet.subnet-1.id

  count             = 3
  key_name          = "aws_key"

  root_block_device {
    volume_type     = "gp2"
    volume_size     = "20"
    delete_on_termination   = true
  }

  user_data = "${file("user-data.sh")}"
                
  tags = {
    Name = var.instance_tags_names[count.index]
  }
}


