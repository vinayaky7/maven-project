resource "aws_eks_node_group" "radical-workernode" {
  cluster_name  = aws_eks_cluster.radical-myeks.name
  node_group_name = "radical-workernodes"
  version         = "1.24"
  node_role_arn  = aws_iam_role.myworkernodes.arn
  subnet_ids   = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id, aws_subnet.public_subnet_3.id, aws_subnet.public_subnet_4.id]
  instance_types = ["t3.medium"]
 
  scaling_config {
   desired_size = 3
   max_size   = 3
   min_size   = 1
  }
 
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    #aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
}