variable "lambda_function_name" {
  description = "lambda function name"
  type        = string
}

variable "lambda_role_arn" {
  description = "ARN role for the lambda"
  type        = string
}

variable "lambda_handler" {
  description = "lambda handler"
  type        = string
}

variable "lambda_runtime" {
  description = "lambda runtime"
  type        = string
}

variable "lambda_source_file_path" {
  description = "path to lambda code"
  type        = string
}