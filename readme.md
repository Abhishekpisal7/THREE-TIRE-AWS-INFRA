# Three-Tier AWS Infrastructure (Terraform)

This repository contains a **Terraform** configuration for deploying a modular, three-tier
architecture on **Amazon Web Services (AWS)**. It is designed to support multiple
environments (dev, stage, prod) with reusable modules and configuration files.

## 🧱 Project Structure

```plaintext
├── backend.tf           # Remote state configuration
├── provider.tf          # AWS provider setup
├── variables.tf         # Global variables definitions
├── outputs.tf           # Global outputs
├── terraform.tfvars     # Default variable values (environment-specific overrides live in environments/*)
├── modules/             # Reusable modules (vpc, subnets, security-groups, etc.)
├── environments/        # Environment-specific configuration directories
│   ├── dev/
│   ├── stage/
│   └── prod/
└── scripts/             # Helper scripts (example userdata for EC2 instances)
```

Each module encapsulates a piece of infrastructure (for example, `vpc/`, `ec2/`,
`security-groups/`) along with its own variables and outputs. This promotes
reusability and clarity when composing environments.

## 🚀 Features

- **Three-tier design**: VPC, subnet, security groups, NAT/Internet gateways, routing,
  application and database layers.
- **Modular**: Infrastructure broken into logical modules for maintainability.
- **Multi-environment support**: Separate directories for `dev`, `stage`, and `prod`.
- **AWS-native**: Uses IAM, Auto Scaling, RDS, EC2, ALB, etc.

## 🛠 Usage

1. **Install Terraform**.
2. Clone the repo and `cd` into the project root:
   ```bash
   git clone <repo-url>
   cd three-tier-aws-infra
   ```
3. Initialize Terraform (choose an environment folder if using partial configs):
   ```bash
   terraform init
   ```
4. Inspect the plan:
   ```bash
   terraform plan -var-file="environments/dev/terraform.tfvars"
   ```
5. Apply the configuration:
   ```bash
   terraform apply -var-file="environments/dev/terraform.tfvars"
   ```

> Replace `dev` with `stage` or `prod` as needed. Environment-specific variables
> and overrides are kept under `environments/<env>/`.

## 📁 Modules Overview

- **alb**: Application Load Balancer configuration
- **autoscaling**: Auto Scaling groups for compute tiers
- **bastion**: Bastion host configuration with user data
- **ec2**: EC2 instance definitions
- **iam**: IAM roles and policies
- **internet-gateway**: Public gateway for VPC
- **nat-gateway**: NAT gateway for private subnets
- **rds**: Database instances (RDS)
- **route-tables**: Routing between subnets and gateways
- **security-groups**: Security group definitions
- **subnets**: Public/private subnets across AZs
- **vpc**: VPC configuration and CIDR blocks

Each module has its own variables and outputs files; refer to those modules for
specific usage details.

## 🔧 Customization

- Modify `terraform.tfvars` or environment-specific tfvars to adjust CIDRs,
  instance sizes, AWS regions, etc.
- Add or adjust module inputs when composing a new environment.

## 🧪 Testing & Validation

Run `terraform validate` to ensure configuration correctness. Use `terraform fmt`
for formatting, and consider using `tflint`/`checkov` for policy and lint checks.

## 📄 Notes

- State is configured in `backend.tf` (likely using S3/DynamoDB). Update the
  backend configuration to match your AWS account.
- This repository assumes you have AWS credentials configured via environment
  variables, shared credentials file, or another supported method.
