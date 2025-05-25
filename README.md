# Cloud Security Policy as Code

![GRC Status](https://img.shields.io/badge/GRC%20Status-Automated-blue)
![Compliance](https://img.shields.io/badge/Compliance-HIPAA%2C%20NIST%20800--53%2C%20CIS-green)
![Terraform](https://img.shields.io/badge/IaC-Terraform-623CE4?logo=terraform)
![GitHub Actions](https://img.shields.io/badge/CI-GitHub%20Actions-2088FF?logo=github-actions)
![License](https://img.shields.io/badge/license-MIT-lightgrey)

## Overview
This repository manages an organization’s official Cloud Security Policy using Markdown to enable version control, transparent collaboration, and real-time updates. It is tailored for the healthcare industry, ensuring alignment with HIPAA and cloud-specific compliance mandates.

The policy is stored in a GitHub repository with branch protection, automated review workflows, and traceable change history. This Git-native model enables GRC and engineering teams to collaborate on security governance seamlessly.

## Objectives
- Author and manage cloud security policy in Markdown
- Track all changes with Git commit history and reviewer approvals
- Integrate compliance checks into pull requests using GitHub Actions
- Provide a searchable, linkable policy that reflects real-time state
- Support audit readiness with evidence of access, edits, and reviews

## Architecture Diagram
(Lucidchart or Draw.io link showing Markdown repo + PR review pipeline + GitHub Actions + AWS S3 for backups + GitHub Audit Logs)

## Prerequisites
- GitHub repository with branch protections
- CODEOWNERS configured for mandatory review
- GitHub Actions enabled
- AWS CLI configured
- Optional: AWS CodeCommit or CodeArtifact for private backup/mirroring

## Lab Steps
1. Clone the repository:  
   `git clone https://github.com/your-org/cloudsecurity-policy-repo-gov`

2. Create initial policy:
   ```bash
   mkdir -p docs
   touch docs/cloud-security-policy.md
   git add docs/cloud-security-policy.md
   git commit -m "Initial cloud security policy scaffold"
   git push -u origin main
   ```

3. Set up CODEOWNERS to enforce review:
   ```plaintext
   # .github/CODEOWNERS
   * @grc-leads @cloud-architects
   ```

4. Create `.gitignore` to protect local and sensitive files:
   ```plaintext
   *.tfstate
   *.log
   .terraform/
   *.bak
   *.zip
   aws-exports.js
   credentials
   .env
   ```

5. Enable GitHub Actions with policy linter (e.g., markdownlint)
6. Optional: Sync to AWS CodeCommit or store snapshots in S3 for resilience

## Cloud Security Policy Content (Healthcare Aligned)

Stored in `docs/cloud-security-policy.md` with the following outline:
- IAM and Role Management
- Data Protection (S3, KMS, TLS)
- Logging and Monitoring (CloudTrail, Config, GuardDuty)
- System Security and Patch Management
- Incident Response and Escalation
- Change Management through IaC
- Quarterly Audits and Artifact Evidence
- Workforce Training and Awareness

## Automation (GitHub Actions + AWS)
- GitHub Actions: Lint `cloud-security-policy.md`
- GitHub Actions: Terraform deployment pipeline
- AWS S3: Backup every merged policy version
- AWS IAM Access Analyzer: Region-wide enablement
- AWS Config: Managed rules for encryption and MFA

## Terraform IaC
- AWS Config Rules for S3 encryption and IAM MFA
- SNS + Lambda remediation trigger setup
- Python function to enforce encryption

## Drift Detection and Auto-Remediation Lab
- Simulates unencrypted S3 drift
- Remediates via Lambda
- Optionally logs GitHub Issue for audit evidence

## Compliance Mapping
| Control ID | Framework | Description | Implementation |
|-----------|-----------|-------------|----------------|
| PL-2 | NIST 800-53 | System Security and Privacy Plan | Policy versioned in Git with mandatory review |
| A.5.1.1 | ISO 27001 | Policies for Information Security | Stored as Markdown, reviewed quarterly |
| 14.2 | CIS Controls | Establish and Maintain Security Policies | GitHub with audit logs and CODEOWNERS |
| 164.308(a)(1)(ii)(A) | HIPAA Security Rule | Risk Management Process | Git-backed policies & PR traceability |

## Skills Demonstrated
- GRC-as-Code using GitHub and Markdown
- Policy governance aligned with NIST, ISO, HIPAA
- GitOps for compliance control tracking
- GitHub CI for policy review workflows
- AWS integration for backup and evidence collection
- Terraform for AWS Config compliance enforcement
- CI pipeline for infrastructure policy deployment
- Automated drift detection and remediation

## Resources
- [NIST 800-53 PL Control Family](https://csrc.nist.gov)
- [HIPAA Security Rule Summary](https://www.hhs.gov/hipaa/for-professionals/security/laws-regulations/index.html)
- [CIS Controls v8](https://www.cisecurity.org/controls/cis-controls-list/)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [AWS Config Rule Reference](https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html)
