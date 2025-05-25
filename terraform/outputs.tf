output "s3_config_rule_name" {
  value = aws_config_config_rule.s3_encrypted.name
}

output "iam_config_rule_name" {
  value = aws_config_config_rule.iam_mfa.name
}
