terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.27"
        }
    }

    required_version = ">= 0.14.9"
}

provider "aws"{
    region = var.aws_region
    profile = "default"
}

resource "aws_instance" "app_server" {
    ami = "ami-0aa2b7722dc1b5612"
    instance_type = var.instance
    key_name = var.key 
    security_groups = [aws_security_group.general_access.name]
    tags = {
        Name = "Terraform Ansible Python"
    }
}

resource "aws_key_pair" "sshkey"{
    key_name = var.key
    public_key = file("${var.key}.pub")
}

output "public_IP" {
    value = aws_instance.app_server.public_ip 
}