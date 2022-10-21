resource "aws_autoscaling_policy" "cpu_up" {
  name = format("%s-nodes-cpu-scale-up", var.cluster_name)

  adjustment_type = "ChangeInCapacity"

  cooldown           = lookup(var.auto_scale_cpu, "scale_up_cooldown")
  scaling_adjustment = lookup(var.auto_scale_cpu, "scale_up_add")

  autoscaling_group_name = aws_eks_node_group.cluster.resources[0].autoscaling_groups[0].name
}
