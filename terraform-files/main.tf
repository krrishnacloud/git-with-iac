provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "vpc_main" {
  cidr_block = "10.0.0.0/24"
  enable_dns_hostnames = true
}

resource "aws_subnet" "sub1" {
  vpc_id =  aws_vpc.vpc_main.id
  cidr_block = "10.0.0.0/28"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "sub2" {
  vpc_id =  aws_vpc.vpc_main.id
  cidr_block = "10.0.0.0/28"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "sub3" {
  vpc_id =  aws_vpc.vpc_main.id
  cidr_block = "10.0.0.0/28"
  availability_zone = "us-east-1c"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igt" {
  vpc_id = aws_vpc.vpc_main.id
}

resource "aws_route_table" "rtw" {
  vpc_id = aws_vpc.vpc_main.id

route {
  cidr_block = "10.0.0.0/0"
  gateway_id = aws_internet_gateway.igt.id
}

route {
  cidr_block = "10.0.0.0/16"
  gateway_id = "local"
}
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = "my-cluster"
  kubernetes_version = "1.33"

  endpoint_public_access = true

  vpc_id = aws_vpc.vpc_main.id
  subnet_ids = ["sub1", "sub2", "sub3"]
  control_plane_subnet_ids = ["sub1", "sub26", "sub3"]

  eks_managed_node_groups = {
    workernode = {
      instance_type = ["t2.micro"]
      min_size = 2
      max_size = 5
      desired_size = 2
    }
  }
}