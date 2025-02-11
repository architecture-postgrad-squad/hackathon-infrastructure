resource "aws_s3_bucket" "bucket_imagens" {
  bucket = var.bucket_name

  tags = {
    Name        = "Bucket de Imagens"
  }
}

resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket = aws_s3_bucket.bucket_imagens.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
