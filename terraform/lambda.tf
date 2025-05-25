...(keep existing content)...

## Terraform IaC
- AWS Config Rules for S3 encryption and IAM MFA
- SNS + Lambda remediation trigger setup
- Python function to enforce encryption
- Modular `lambda.tf` for clean separation of responsibilities

## lambda.tf Content
```hcl
resource "aws_iam_role" "lambda_exec" {
  name = "lambda-s3-remediator"

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

resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "remediate_s3_encryption" {
  filename         = "lambda/remediate_s3_encryption.zip"
  function_name    = "remediateS3Encryption"
  role             = aws_iam_role.lambda_exec.arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.9"
  source_code_hash = filebase64sha256("lambda/remediate_s3_encryption.zip")

  environment {
    variables = {
      LOG_LEVEL = "INFO"
    }
  }
}

resource "aws_lambda_permission" "allow_config" {
  statement_id  = "AllowExecutionFromConfig"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.remediate_s3_encryption.function_name
  principal     = "config.amazonaws.com"
}
```

This isolates all remediation infrastructure in `lambda.tf`, supporting traceable deployments and clean modular control.
