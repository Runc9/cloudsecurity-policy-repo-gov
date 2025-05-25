# Cloud Security Policy (Healthcare Aligned)

## 1. Identity and Access Management (IAM)
- All user and service identities are managed through AWS IAM and Identity Center.
- Enforce MFA for all accounts (root access is disabled).
- Roles and policies follow least privilege principles.
- Quarterly access reviews are mandatory.

## 2. Data Protection
- All data at rest is encrypted using AWS KMS (CMKs).
- All data in transit must use TLS 1.2 or higher.
- S3 buckets must be encrypted and private by default.

## 3. Logging and Monitoring
- CloudTrail enabled in all regions.
- Logs stored centrally in an encrypted S3 bucket.
- AWS Config and GuardDuty enabled across accounts.

## 4. System Security
- EC2 and containers must pass Inspector/ECR image scan checks.
- Systems Manager used for OS patch management.

## 5. Incident Response
- Use EventBridge for alert triggers.
- Escalation playbooks tested bi-annually.

## 6. Change Management
- All infra changes via GitHub PR and Terraform.
- Enforced with GitHub Actions and CODEOWNERS.

## 7. Auditing & Compliance
- Config compliance reports and S3 evidence snapshots maintained.
- Use AWS Artifact for regulatory reporting (HIPAA, SOC 2).

## 8. Workforce Security
- HIPAA and security training required annually.
- Secure coding workshops bi-annually.
