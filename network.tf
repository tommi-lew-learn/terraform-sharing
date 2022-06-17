resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/27" # 32 addresses. 10.0.0.0 to 10.0.0.31
}

resource "aws_subnet" "subnet_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/28" # 16 addresses. 10.0.0.0 to 10.0.0.15
  availability_zone = "ap-southeast-1a"
}

resource "aws_subnet" "subnet_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.16/28" # 16 addresses. 10.0.0.16 to 10.0.0.31
  availability_zone = "ap-southeast-1b"
}

resource "aws_db_subnet_group" "default" {
  subnet_ids = [
    aws_subnet.subnet_1.id,
    aws_subnet.subnet_2.id,
  ]
}
