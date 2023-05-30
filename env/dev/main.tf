module "aws-dev" {
  source = "../../infra"
  instance = "t2.micro"
  aws_region = "us-east-1"
  key = "iac-dev"
}

output "IP" {
  value = module.aws-dev.public_IP
}