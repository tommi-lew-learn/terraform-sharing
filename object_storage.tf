resource "aws_s3_bucket" "example" {
  bucket = "example-bucket-${random_id.name_suffix.hex}"
}

resource "aws_s3_bucket_acl" "example_acl" {
  bucket = aws_s3_bucket.example.id
  acl    = "private"
}

resource "random_id" "name_suffix" {
  byte_length = 4
}
