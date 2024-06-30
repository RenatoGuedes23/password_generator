aws_region             = "us-east-1"
aws_vpc_name           = "vpc_dev"
aws_vpc_cidr           = "10.0.0.0/16"
aws_vpc_azs            = ["us-east-1a", "us-east-1b", "us-east-1c"]
aws_private_subnet     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
aws_public_subnet      = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
aws_eks_name           = "gerador-prod"
aws_eks_version        = "1.27"
aws_eks_instance_types = ["t3.medium"]
aws_project_tags = {
  Terraform   = "true"
  Environment = "produção"
  Project     = "gerador"
}
