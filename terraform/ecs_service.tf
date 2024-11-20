resource "aws_ecs_service" "todo_server_service_sd" {
  name            = "todo-server-sd"
  cluster         = aws_ecs_cluster.todo_cluster.id
  task_definition = aws_ecs_task_definition.todo_server.arn
  desired_count = 1
  network_configuration {
    subnets = module.vpc.public_subnets
    security_groups = [aws_security_group.todo_server_sg.id]
  }
  service_registries {
    registry_arn = aws_service_discovery_service.django_backend.arn
  }

   capacity_provider_strategy {
   capacity_provider = aws_ecs_capacity_provider.ecs_capacity_provider.name
   weight            = 100
 }
#   force_new_deployment = true
}

resource "aws_ecs_service" "todo_server_nginx_service_sd" {
  name            = "todo-server-nginx-sd"
  cluster         = aws_ecs_cluster.todo_cluster.id
  task_definition = aws_ecs_task_definition.todo_server_nginx_sd.arn
  desired_count = 1
  network_configuration {
    subnets = module.vpc.public_subnets
    security_groups = [aws_security_group.todo_server_nginx_sg.id]
  }
  service_registries {
    registry_arn = aws_service_discovery_service.nginx_backend.arn
  }

   capacity_provider_strategy {
   capacity_provider = aws_ecs_capacity_provider.ecs_capacity_provider.name
   weight            = 100
 }
#   force_new_deployment = true
#   load_balancer {
#     container_name = ""
#     container_port = 0
#   }
}

resource "aws_ecs_service" "todo_server_service_sc" {
  name            = "todo-server-sc"
  cluster         = aws_ecs_cluster.todo_cluster.id
  task_definition = aws_ecs_task_definition.todo_server.arn
  desired_count = 1
  network_configuration {
    subnets = module.vpc.public_subnets
    security_groups = [aws_security_group.todo_server_sg.id]
  }

  service_connect_configuration {
    namespace = aws_service_discovery_private_dns_namespace.todo_cluster.name
    enabled = true
    service {
      client_alias {
        port = 8000
      }
      port_name = "todo-server"
      discovery_name = "django-backend-sc"
    }
  }

   capacity_provider_strategy {
   capacity_provider = aws_ecs_capacity_provider.ecs_capacity_provider.name
   weight            = 100
 }
#   force_new_deployment = true
}

resource "aws_ecs_service" "todo_server_nginx_service_sc" {
  name            = "todo-server-nginx-sc"
  cluster         = aws_ecs_cluster.todo_cluster.id
  task_definition = aws_ecs_task_definition.todo_server_nginx_sc.arn
  desired_count = 1
  network_configuration {
    subnets = module.vpc.public_subnets
    security_groups = [aws_security_group.todo_server_nginx_sg.id]
  }
  service_connect_configuration {
    namespace = aws_service_discovery_private_dns_namespace.todo_cluster.name
    enabled = true
    service {
      client_alias {
        port = 80
      }
      port_name = "todo-server-nginx"
      discovery_name = "nginx-backend-sc"
    }
  }

   capacity_provider_strategy {
   capacity_provider = aws_ecs_capacity_provider.ecs_capacity_provider.name
   weight            = 100
 }
#   force_new_deployment = true
#   load_balancer {
#     container_name = ""
#     container_port = 0
#   }
}
