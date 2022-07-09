resource "aws_eks_cluster" "radical-myeks" {
 name = "radical-myeks"
 role_arn = aws_iam_role.eks-iam-role.arn

 vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = true
    subnet_ids = [var.subnet_id_1, var.subnet_id_2, var.subnet_id_3]
 }

 resource "aws_security_group_rule" "example" {
      type              = "ingress"
      from_port         = 0
      to_port           = 65535
      protocol          = "tcp"
      cidr_blocks       = ["0.0.0.0/0"]
    
      security_group_id = vpc_config.cluster_security_group_id
 }

 depends_on = [
  aws_iam_role.eks-iam-role,
 ]
}