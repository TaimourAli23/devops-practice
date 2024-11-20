resource "aws_service_discovery_private_dns_namespace" "todo_cluster" {
  name        = "todo.cluster"
  description = "Namespace for todo ECS cluster"
  vpc         = module.vpc.vpc_id
}

resource "aws_service_discovery_service" "django_backend" {
  name = "django.backend.sd"

  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.todo_cluster.id

    dns_records {
      ttl  = 10
      type = "A"
    }

    routing_policy = "MULTIVALUE"
  }

  health_check_custom_config {
    failure_threshold = 1
  }
}

resource "aws_service_discovery_service" "nginx_backend" {
  name = "nginx.backend.sd"

  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.todo_cluster.id

    dns_records {
      ttl  = 10
      type = "A"
    }

    routing_policy = "MULTIVALUE"
  }

  health_check_custom_config {
    failure_threshold = 1
  }
}