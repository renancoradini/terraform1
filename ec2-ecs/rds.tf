
resource "aws_db_instance" "name1db" {
  allocated_storage    = 5
  storage_type         = "gp2"
  instance_class       = "db.t2.micro"
  identifier           = "name1db"
  engine               = "postgres"
  engine_version       = "12.10"
  parameter_group_name = "default.postgres12"
 
  db_name  = var.namedb
  username = var.usernameDB
  password = var.passwordDB
 
  vpc_security_group_ids = [aws_security_group.postgres.id]
  publicly_accessible    = false # Only for testing!
  skip_final_snapshot    = true
}