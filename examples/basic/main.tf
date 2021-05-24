provider "aws" {
  region = var.region
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)  
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
  version                = "~> 1.10"
  }

module "eks" {
  #source          = "terraform-aws-modules/eks/aws"
  source = "../.."
  cluster_name    = "my-eks-cluster"
  cluster_version = "1.19"
  subnets         = ["subnet-06fbe63799751cdba", "subnet-062f6e24997f61f0a"]
  vpc_id          = "vpc-0669a93e58272b4a1"

  worker_groups = [
    {
      instance_type = "t3.small"
      asg_max_size  = 3
    }
  ]
}