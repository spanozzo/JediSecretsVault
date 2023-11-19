variable "bucket_name" {
  description = "s3 bucket name for Jedi manifest"
  type        = string
}

variable "kms_key_arn" {
  description = "KMS key ARN to encrypt S3 bucket"
  type        = string
}

variable "lambda_function_arn" {
  description = "lambda function ARN"
  type        = string
}