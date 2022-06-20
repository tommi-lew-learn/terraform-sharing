variable "bucket_names" {
  type = list(string)
  default = ["apple", "banana", "calamansi"]
}

resource "aws_s3_bucket" "example" {
  for_each = toset(var.bucket_names)

  bucket = "example-bucket-${random_id.name_suffix.hex}-${each.key}"
}

resource "aws_s3_bucket_acl" "example_acl" {
  for_each = toset(var.bucket_names)
  
  bucket = aws_s3_bucket.example[each.key].id
  acl    = "private"
}

resource "random_id" "name_suffix" {
  byte_length = 4
}
