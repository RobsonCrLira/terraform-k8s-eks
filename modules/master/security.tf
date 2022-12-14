resource "aws_security_group" "cluster_master_sg" {
  name   = format("%s-master-sg", var.cluster_name)
  vpc_id = var.cluster_vpc.id

  egress {
    from_port = 0
    to_port   = 0

    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = format("%s-master-sg", var.cluster_name)
  }
}
resource "aws_security_group_rule" "cluser_ingress_https" {
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 0
  to_port     = 65535
  protocol    = "tcp"

  security_group_id = aws_security_group.cluster_master_sg.id

  type = "ingress"
}
