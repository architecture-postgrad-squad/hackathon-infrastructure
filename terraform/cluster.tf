resource "aws_vpc" "hackathon_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "hackathon-vpc"
  }
}

resource "aws_subnet" "hackathon_subnet_1" {
  vpc_id            = aws_vpc.hackathon_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "hackathon_subnet_1"
  }
}

resource "aws_subnet" "hackathon_subnet_2" {
  vpc_id            = aws_vpc.hackathon_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "hackathon-subnet-2"
  }
}

resource "aws_eks_cluster" "hackathon_eks" {
  name     = "hackathon-cluster"
  role_arn = "arn:aws:iam::925162579276:role/LabRole"

  vpc_config {
    subnet_ids = [aws_subnet.hackathon_subnet_1.id, aws_subnet.hackathon_subnet_2.id]
  }
}

resource "aws_eks_node_group" "snack_bar_worker_group" {
  cluster_name    = aws_eks_cluster.hackathon_eks.name
  node_group_name = "hackathon-worker-group"
  node_role_arn   = "arn:aws:iam::925162579276:role/LabRole"
  subnet_ids = [aws_subnet.hackathon_subnet_1.id, aws_subnet.hackathon_subnet_2.id]

  scaling_config {
    desired_size = 2
    max_size     = 4
    min_size     = 1
  }

  depends_on = [
    aws_eks_cluster.hackathon_eks
  ]
}