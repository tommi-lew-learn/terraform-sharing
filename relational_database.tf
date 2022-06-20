resource "aws_db_instance" "example" {
  count = 0

  engine = "postgres"

  # Reference: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html
  instance_class = "db.t3.micro"

  allocated_storage = 10

  db_name  = "db_name"
  username = "db_username"
  password = "db_password"

  db_subnet_group_name = aws_db_subnet_group.default.name

  skip_final_snapshot = true
}
