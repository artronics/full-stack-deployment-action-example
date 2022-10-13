resource "aws_s3_bucket" "example" {
  bucket = "${local.name_prefix}-example"
}
