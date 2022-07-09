resource "aws_security_group_rule" "example" {
      type              = "ingress"
      from_port         = 0
      to_port           = 65535
      protocol          = "tcp"
      cidr_blocks       = ["0.0.0.0/0"]
    
      security_group_id = aws_eks_cluster.cluster.vpc_config[0].cluster_security_group_id
 }