# Terraform Basic Assignment - AWS EC2 Provisioning

## Objective

Provision an AWS EC2 instance using Terraform (Infrastructure as Code) covering the core workflow: `init`, `plan`, and `apply`.

---

## Project Structure

```
my-terraform/
├── main.tf            # Provider and resource definitions
├── variables.tf       # Input variable declarations
├── outputs.tf         # Output value definitions
├── terraform.tfvars   # Variable values
└── README.md
```

---

## Prerequisites

- Terraform v1.0 or above installed
- AWS account with an IAM user that has EC2 permissions
- AWS Access Key ID and Secret Access Key ready

---

## Steps to Run

### Step 1 - Clone or create the project folder

```bash
mkdir my-terraform
cd my-terraform
```

Place all the `.tf` files and `terraform.tfvars` inside this folder.

### Step 2 - Set AWS Credentials

Option A - Environment variables (recommended for assignments):

```bash
export AWS_ACCESS_KEY_ID="your-access-key-id"
export AWS_SECRET_ACCESS_KEY="your-secret-access-key"
```

Option B - AWS CLI:

```bash
aws configure
```

### Step 3 - Initialize Terraform

Downloads the AWS provider plugin and sets up the backend.

```bash
terraform init
```

Expected output:

```
Initializing the backend...
Initializing provider plugins...
- Installing hashicorp/aws...

Terraform has been successfully initialized!
```

### Step 4 - Validate the Configuration

Checks for syntax errors in your `.tf` files.

```bash
terraform validate
```

Expected output:

```
Success! The configuration is valid.
```

### Step 5 - Plan the Deployment

Preview what resources will be created without making any actual changes.

```bash
terraform plan
```

You will see a summary showing 1 resource to add (`aws_instance.my_instance`).

### Step 6 - Apply the Configuration

Creates the EC2 instance on AWS. Type `yes` when prompted.

```bash
terraform apply
```

Expected output after completion:

```
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

instance_id        = "i-xxxxxxxxxxxxxxxxx"
instance_public_ip = "x.x.x.x"
instance_state     = "running"
```

### Step 7 - Verify on AWS Console

- Go to AWS Console > EC2 > Instances > Region: ap-south-1
- Confirm instance named `Terraform-Student-Instance` is in running state with type `t3.micro`

---

## Variables Reference

| Variable | Default | Description |
|---|---|---|
| `aws_region` | `ap-south-1` | AWS region for deployment |
| `ami_id` | `ami-0f58b397bc5c1f2e8` | Amazon Linux AMI (ap-south-1) |
| `instance_type` | `t3.micro` | EC2 instance type |
| `instance_name` | `Terraform-Student-Instance` | Name tag for the instance |

---

## Outputs Reference

| Output | Description |
|---|---|
| `instance_public_ip` | Public IP of the EC2 instance |
| `instance_id` | AWS instance ID |
| `instance_state` | Current state (running/stopped) |

---

## Commands Summary

| Command | Purpose |
|---|---|
| `terraform init` | Initialize project and download providers |
| `terraform validate` | Check configuration for errors |
| `terraform plan` | Preview changes before applying |
| `terraform apply` | Create the resources on AWS |
| `terraform destroy` | Delete all resources created by this config |

---

## Cleanup

Run this after the assignment to avoid AWS charges:

```bash
terraform destroy
```

Type `yes` when prompted.

---

## Notes

- The AMI ID `ami-0f58b397bc5c1f2e8` is region-specific to `ap-south-1`. It will not work in other regions.
- `t3.micro` is free tier eligible for up to 750 hours/month.
- Never commit your AWS credentials or `.tfstate` files to GitHub. Add them to `.gitignore`.
