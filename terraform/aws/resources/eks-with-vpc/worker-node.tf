resource "aws_eks_node_group" "radical-workernode" {
  cluster_name  = aws_eks_cluster.radical-myeks.name
  node_group_name = "radical-workernodes"
  node_role_arn  = aws_iam_role.myworkernodes.arn
  subnet_ids   = [var.subnet_id_1, var.subnet_id_2, var.subnet_id_3, var.subnet_id_4]
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