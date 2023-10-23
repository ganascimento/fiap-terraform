resource "aws_subnet" "subnet_private_1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-2a"

  tags = {
    "Name"                                      = "private-us-east-2a"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }

}

resource "aws_subnet" "subnet_private_1b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-2b"

  tags = {
    "Name"                                      = "private-us-east-2b"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }

}

resource "aws_route_table_association" "eks_private_rt_association_1a" {
  subnet_id      = aws_subnet.subnet_private_1a.id
  route_table_id = aws_route_table.eks_nat_rt.id
}

resource "aws_route_table_association" "eks_private_rt_association_1b" {
  subnet_id      = aws_subnet.subnet_private_1b.id
  route_table_id = aws_route_table.eks_nat_rt.id
}
