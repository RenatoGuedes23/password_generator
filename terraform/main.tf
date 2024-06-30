module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"

  name            = var.aws_eks_name
  cidr            = var.aws_vpc_cidr
  private_subnets = var.aws_private_subnet
  public_subnets  = var.aws_public_subnet
  azs             = var.aws_vpc_azs

  enable_nat_gateway   = true
  enable_vpn_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = merge(var.aws_project_tags, {
    "kubernetes.io/cluster/${var.aws_eks_name}" = "shared"
    }
  )

  public_subnet_tags = {

    "kubernetes.io/cluster/${var.aws_eks_name}" = "shared"
    "kubernetes.io/role/elb"                    = 1

  }

  private_subnet_tags = {

    "kubernetes.io/cluster/${var.aws_eks_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = 1

  }

}



module "gerador-dev" {

  source  = "terraform-aws-modules/eks/aws"
  version = "19.16.0"

  cluster_name    = var.aws_eks_name
  cluster_version = var.aws_eks_version


  subnet_ids                     = module.vpc.private_subnets
  vpc_id                         = module.vpc.vpc_id
  cluster_endpoint_public_access = true


  eks_managed_node_groups = {

    live = {
      min_size     = 1
      max_size     = 3
      desired_size = 3

      instance_types = var.aws_eks_instance_types

      tags = var.aws_project_tags

    }

  }

  tags = var.aws_project_tags

}

