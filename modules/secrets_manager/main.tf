resource "aws_secretsmanager_secret" "jedi_secret" {
  name = var.jedi_secret_name
}

resource "aws_secretsmanager_secret_version" "jedi_secret_version" {
  secret_id     = aws_secretsmanager_secret.jedi_secret.id
  secret_string = var.jedi_secret_value
}