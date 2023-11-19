output "jedi_secret_arn" {
  description = "Secrets Manager ARN"
  value       = aws_secretsmanager_secret.jedi_secret.arn
}