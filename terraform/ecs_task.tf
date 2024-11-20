resource "aws_ecs_task_definition" "todo_server" {
  family                   = "todo-server"
  requires_compatibilities = ["EC2"]

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }

  network_mode = "awsvpc"
  cpu          = "256"
  memory       = "256"

  container_definitions = <<DEFINITION
  [
    {
      "name": "todo-server-container",
      "image": "604977880911.dkr.ecr.us-east-1.amazonaws.com/todo/server:latest",
      "cpu": 0,
      "portMappings": [
        {
          "name": "todo-server",
          "containerPort": 8000,
          "hostPort": 8000,
          "protocol": "tcp"
        }
      ],
      "essential": true,
      "command": [
        "uwsgi",
        "--module",
        "todo_project.wsgi",
        "--master",
        "--processes",
        "4",
        "--threads",
        "2",
        "--socket",
        "0.0.0.0:8000",
        "--vacuum"
      ],
      "environment": [],
      "mountPoints": [],
      "volumesFrom": [],
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "/ecs/todo-server",
          "awslogs-region": "us-east-1",
          "awslogs-stream-prefix": "ecs"
        }
      }
    }
  ]
DEFINITION
}

resource "aws_ecs_task_definition" "todo_server_nginx_sc" {
  family                   = "todo-server-nginx-sc"
  requires_compatibilities = ["EC2"]

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }

  network_mode = "awsvpc"
  cpu          = "256"
  memory       = "256"

  container_definitions = <<DEFINITION
  [
    {
      "name": "todo-server-nginx",
      "image": "604977880911.dkr.ecr.us-east-1.amazonaws.com/todo/server/nginx:sc",
      "cpu": 256,
      "memory": 256,
      "memoryReservation": 256,
      "portMappings": [
      {
      "name": "todo-server-nginx",
      "containerPort": 80,
      "hostPort": 80,
      "protocol": "tcp",
      "appProtocol": "http"
      }
      ],
      "essential": true,
      "environment": [],
      "environmentFiles": [],
      "mountPoints": [],
      "volumesFrom": [],
      "ulimits": [],
      "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
      "awslogs-group": "/ecs/todo-server-nginx",
      "mode": "non-blocking",
      "awslogs-create-group": "true",
      "max-buffer-size": "25m",
      "awslogs-region": "us-east-1",
      "awslogs-stream-prefix": "ecs"
      },
      "secretOptions": []
      },
      "systemControls": []
    }
  ]
DEFINITION
}

resource "aws_ecs_task_definition" "todo_server_nginx_sd" {
  family                   = "todo-server-nginx-sd"
  requires_compatibilities = ["EC2"]

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }

  network_mode = "awsvpc"
  cpu          = "256"
  memory       = "256"

  container_definitions = <<DEFINITION
  [
    {
      "name": "todo-server-nginx",
      "image": "604977880911.dkr.ecr.us-east-1.amazonaws.com/todo/server/nginx:sd",
      "cpu": 256,
      "memory": 256,
      "memoryReservation": 256,
      "portMappings": [
      {
      "name": "todo-server-nginx",
      "containerPort": 80,
      "hostPort": 80,
      "protocol": "tcp",
      "appProtocol": "http"
      }
      ],
      "essential": true,
      "environment": [],
      "environmentFiles": [],
      "mountPoints": [],
      "volumesFrom": [],
      "ulimits": [],
      "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
      "awslogs-group": "/ecs/todo-server-nginx",
      "mode": "non-blocking",
      "awslogs-create-group": "true",
      "max-buffer-size": "25m",
      "awslogs-region": "us-east-1",
      "awslogs-stream-prefix": "ecs"
      },
      "secretOptions": []
      },
      "systemControls": []
    }
  ]
DEFINITION
}
