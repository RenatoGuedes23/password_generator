module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"

  name            = "minha_vpc"
  cidr            = "10.0.0.0/16"
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]

  enable_nat_gateway   = true
  enable_vpn_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = {

    "kubernetes.io/cluster/gerador" = "shared"
    "kubernetes.io/cluster/elb"     = 1
  }

  public_subnet_tags = {

    "kubernetes.io/cluster/gerador" = "shared"
    "kubernetes.io/cluster/elb"     = 1

  }

  private_subnet_tags = {

    "kubernetes.io/cluster/gerador" = "shared"
    "kubernetes.io/cluster/elb"     = 1

  }

}



module "gerador-dev" {

  source  = "terraform-aws-modules/eks/aws"
  version = "19.16.0"

  cluster_name    = "gerador-dev"
  cluster_version = "1.27"


  subnet_ids                     = module.vpc.private_subnets
  vpc_id                         = module.vpc.vpc_id
  cluster_endpoint_public_access = true


  eks_managed_node_groups = {

    live = {
      min_size     = 1
      max_size     = 3
      desired_size = 3

      instance_types = ["t3.medium"]
    }

  }

}




