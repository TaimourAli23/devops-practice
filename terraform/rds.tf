resource "aws_db_instance" "todo_db_1" {
  engine            = "postgres"
  engine_version    = "16.3"
  db_name           = "tododb"
  identifier        = "todo-db"
  instance_class    = "db.t4g.micro"
  username          = "postgres"
  password          = "admin123"
  allocated_storage = 20

  db_subnet_group_name   = module.vpc.database_subnet_group_name
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  parameter_group_name   = "default.postgres16"
  skip_final_snapshot    = true

  depends_on = [module.vpc]
}