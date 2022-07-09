resource "aws_eks_cluster" "radical-myeks" {
 name = "radical-myeks"
 role_arn = aws_iam_role.eks-iam-role.arn

 vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = true
    subnet_ids = [var.subnet_id_1, var.subnet_id_2, var.subnet_id_3]
 }

 depends_on = [
  aws_iam_role.eks-iam-role,
 ]
}