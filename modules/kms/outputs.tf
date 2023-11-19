output "kms_key_arn" {
  value = aws_kms_key.s3_encryption_key.arn
}