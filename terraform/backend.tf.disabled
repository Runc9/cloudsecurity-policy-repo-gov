terraform {
  backend "s3" {
    bucket         = "your-secure-tf-state-bucket"
    key            = "cloudsecurity-policy/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}
