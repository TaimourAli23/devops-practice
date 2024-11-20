resource "aws_autoscaling_group" "todo_cluster_asg" {
  name                = "todo-cluster-asg"
#   name_prefix = "todo-asg"
  vpc_zone_identifier = module.vpc.public_subnets
  desired_capacity    = 5
  max_size            = 6
  min_size            = 1

  health_check_type         = "EC2"
  health_check_grace_period = 300

  launch_template {
    id      = aws_launch_template.ecs_instance_template.id
    version = "$Latest"
  }
   tag {
   key                 = "AmazonECSManaged"
   value               = true
   propagate_at_launch = true
 }
}

