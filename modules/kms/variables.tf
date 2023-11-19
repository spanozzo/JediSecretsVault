variable "aws_account_id" {
  description = "AWS account ID"
  type        = string
}

variable "role_name" {
  description = "IAM role that will use the KMS key"
  type        = string
}