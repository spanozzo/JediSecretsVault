resource "aws_lambda_function" "lambda" {
  function_name = var.lambda_function_name
  role          = var.lambda_role_arn
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime
  filename      = var.lambda_source_file_path
}