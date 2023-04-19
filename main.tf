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
    region = "us-east-1"
    profile = "default"
}

resource "aws_instance" "app_server" {
    ami = "ami-0aa2b7722dc1b5612"
    instance_type = "t2.micro"
    key_name = "iac-rsmatos"
    # user_data = <<-EOF
    #                #!/bin/bash
    #                cd /home/ubuntu
    #                echo "<h1>Feito pelo terraform</h1>" > index.html
    #                nohup busybox httpd -f -p 8080 &
    #                EOF
    tags = {
        Name = "Teste aws"
    }
}

