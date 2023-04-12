# Terraform Sentinel Demo

This is a demo of HashiCorp Terraform's Enterprise feature set, including:

- Sentinel Policy Enforcement
- VCS Integration
- Cloud Cost Controls

This demo can be run in Terraform Cloud (Team & Governance, Business editions) as well as Terraform Enterprise (self-hosted). 

## Requirements

* A TFC/E account & organization. Sign up for a free trial of TFC [here](https://app.terraform.io/signup/account)
* Cloud provider credentials to provision resources (only AWS supported at the moment)
* Terraform CLI installed locally

## Configuration

1. [Fork](https://learn.hashicorp.com/tutorials/terraform/cloud-workspace-create#fork-a-github-repository) this repository to a GitHub Organizations account (Free for 1 user/org)

1. Set your TFC/E organization name in `demo-terraform-sentinel/aws/backend.tf` & commit your changes.
1. [Connect Terraform To GitHub](https://learn.hashicorp.com/tutorials/terraform/cloud-workspace-create#connect-terraform-cloud-to-github)
1. [Select the newly-forked repository](https://learn.hashicorp.com/tutorials/terraform/cloud-workspace-create#choose-a-repository) 

1. Configure AWS credentials on a per-workspace basis (if using dynamic credentials) or using a [Variable Set](https://learn.hashicorp.com/tutorials/terraform/cloud-create-variable-set?in=terraform/cloud-get-started) and applying to the new workspace (static credentials)
1. [Connect](https://learn.hashicorp.com/tutorials/terraform/policy-quickstart?in=terraform/cloud-get-started) the policies to Terraform via Policy Sets

    * to enforce all policies, point to sentinel.hcl in the root CSP directory 
        * Example: sentinel-policies/aws/sentinel.hcl
    * to enforce individual policies, point to sentinel.hcl within the specific policy subdirectory
        * Example: sentinel-policies/aws/enforce-cost-contro/sentinel.hcl



## Usage

By default, the following Sentinel policies are being evaluated:
* ec2_instance type is t2.micro, t2.small, or t2.medium (Hard Mandatory)
* Cost Control must be less than $10/month (Soft Mandatory)

To trigger a policy check failure, leave the configurations as-is and start the plan:

<b>CLI-driven Run Method</b>

Initialize the configuration:
```hcl
terraform init
```

Create the execution plan:
```hcl
terraform plan
```
or 
```hcl
terraform plan --var-file=variables.tfvars
```

You should see a failure for both policies in the output. To pass, simply change the instance type to one of the allowed instances, and re-execute the plan. 

You'll get a warning for the cost control policy but the plan will still be allowed to execute.

