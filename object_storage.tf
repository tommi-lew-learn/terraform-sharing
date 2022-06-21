variable "bucket_names" {
  type    = list(string)
  default = ["apple", "banana", "calamansi"]
}

resource "aws_s3_bucket" "example" {
  for_each = toset(var.bucket_names)

  bucket = "example-bucket-${random_id.name_suffix.hex}-${each.key}"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  for_each = toset(var.bucket_names)

  bucket = aws_s3_bucket.example[each.key].id
  versioning_configuration {
    status = "Disabled"
  }
}

resource "aws_s3_bucket_acl" "example_acl" {
  for_each = toset(var.bucket_names)

  bucket = aws_s3_bucket.example[each.key].id

  # possible values: private public-read public-read-write authenticated-read aws-exec-read log-delivery-write
  acl = "private"
}

resource "random_id" "name_suffix" {
  byte_length = 4
}

output "object_storage_domain_names" {
  value = [
    for bucket in aws_s3_bucket.example : b.bucket_domain_name
  ]
}
