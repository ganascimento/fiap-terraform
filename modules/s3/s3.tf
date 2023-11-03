resource "aws_s3_bucket" "lambda_bucket" {
  bucket        = "vg-fiap-restaurant-lambda-s3-bucket"
  force_destroy = true

  tags = {
    Name = "FiapRestaurantBucker"
  }
}

resource "aws_s3_bucket_public_access_block" "lambda_bucket" {
  bucket = aws_s3_bucket.lambda_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
