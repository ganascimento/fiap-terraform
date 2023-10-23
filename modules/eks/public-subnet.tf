resource "aws_subnet" "subnet_public_1a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                                      = "public-us-east-2a"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "subnet_public_1b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                                      = "public-us-east-2b"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_route_table_association" "route_table_1a" {
  subnet_id      = aws_subnet.subnet_public_1a.id
  route_table_id = aws_route_table.eks_public_rt.id
}

resource "aws_route_table_association" "route_table_1b" {
  subnet_id      = aws_subnet.subnet_public_1b.id
  route_table_id = aws_route_table.eks_public_rt.id
}
