output "lambda_arn" {
  description = "lambda function ARN"
  value       = aws_lambda_function.lambda.arn
}