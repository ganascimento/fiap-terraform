resource "aws_eks_cluster" "cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_master_role.arn

  vpc_config {
    subnet_ids = [
      #aws_subnet.subnet_private_1a.id,
      #aws_subnet.subnet_private_1b.id,
      aws_subnet.subnet_public_1a.id,
      aws_subnet.subnet_public_1b.id
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_cluster,
    aws_iam_role_policy_attachment.eks_cluster_service
  ]
}

output "cluster_name" {
  value = aws_eks_cluster.cluster.name
}
