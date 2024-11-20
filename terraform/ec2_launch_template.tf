resource "aws_launch_template" "ecs_instance_template" {
  name          = "todo-asg-launch-template"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deployer.key_name
  image_id      = data.aws_ami.ecs_optimized.id
 iam_instance_profile {
   name = "ecsInstanceRole"
 }
  user_data = filebase64("${path.module}/scripts/ecs.sh")

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.todo_asg_sg.id]

  }
}
