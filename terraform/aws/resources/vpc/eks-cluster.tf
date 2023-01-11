resource "aws_eks_cluster" "radical-myeks" {
 name = "radical-myeks"
 version = "1.24"
 role_arn = aws_iam_role.eks-iam-role.arn

 vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = true
    subnet_ids = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id, aws_subnet.public_subnet_3.id, aws_subnet.public_subnet_4.id]
 }

 depends_on = [
  aws_iam_role.eks-iam-role,
 ]
}