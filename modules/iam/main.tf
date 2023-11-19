resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "lambda_policy" {
  name = "lambda_execution_policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "kms:Decrypt",
          "secretsmanager:GetSecretValue",
        ],
        Effect = "Allow",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy" "lambda_invoke_policy" {
  name = "lambda_invoke_policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "lambda:InvokeFunction",
        Effect = "Allow",
        Resource = "arn:aws:lambda:${var.aws_region}:${var.aws_account_id}:function:${var.lambda_function_name}"      
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}

resource "aws_iam_role_policy_attachment" "lambda_invoke_policy_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_invoke_policy.arn
}