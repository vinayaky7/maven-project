resource "aws_security_group_rule" "example" {
      type              = "ingress"
      from_port         = 0
      to_port           = 65535
      protocol          = "tcp"
      cidr_blocks       = ["0.0.0.0/0"]
    
      security_group_id = vpc_config.cluster_security_group_id
 }