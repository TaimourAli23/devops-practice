resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow Connection to rds "
  vpc_id      = module.vpc.vpc_id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 5432
    protocol    = "tcp"
    to_port     = 5432
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "todo_asg_sg" {
  name        = "todo-asg-sg"
  description = "Allow connection for asg "
  vpc_id      = module.vpc.vpc_id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "todo_server_nginx_sg" {
  name        = "todo-server-nginx-sg"
  description = "Allow connection for asg "
  vpc_id      = module.vpc.vpc_id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "todo_server_sg" {
  name        = "todo-server-sg"
  description = "Allow connection for asg "
  vpc_id      = module.vpc.vpc_id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 8000
    protocol    = "tcp"
    to_port     = 8000
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}