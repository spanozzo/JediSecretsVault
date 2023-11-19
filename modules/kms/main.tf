resource "aws_kms_key" "s3_encryption_key" {
  description = "KMS key for S3 bucket encryption"
  enable_key_rotation = true

	policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          AWS = "arn:aws:iam::${var.aws_account_id}:role/${var.role_name}"
        },
        Action = "kms:*",
        Resource = "*"
      }
    ]
  })
}