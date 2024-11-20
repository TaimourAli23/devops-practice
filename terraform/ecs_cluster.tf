resource "aws_ecs_cluster" "todo_cluster" {
  name = "todo-cluster"
  service_connect_defaults {
    namespace = aws_service_discovery_private_dns_namespace.todo_cluster.arn
  }
}
