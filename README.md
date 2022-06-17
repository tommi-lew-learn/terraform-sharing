# Terraform Sharing

This project is created as part of a sharing session to introduce Terraform.
# Getting Started

The following instructions assume you are using macOS. If you are not using macOS, certain steps also come with alternate installations options. Otherwise, you can fallback on your on your experience and search_engine-fu.

The following instructions assumes you have little to no knowledge of Terraform and some experience with Amazon Web Service (AWS).

## Prerequisites

### [Homebrew](https://brew.sh/)
Follow instructions on the [Homebrew homepage](https://brew.sh/).

### [ASDF](https://asdf-vm.com/)

```
brew install asdf
```

### [Terraform](https://www.terraform.io/cli)
```
asdf plugin-add terraform https://github.com/asdf-community/asdf-hashicorp.git
asdf install
```
Other installation options [here](https://www.terraform.io/downloads).

### (Optional) [direnv](https://direnv.net/)
```
brew install direnv
```
And follow instructions to complete setup. We use this to configure `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` and `AWS_DEFAULT_REGION`. This is optional and you can choose to configure via other methods such as [AWS CLI](https://aws.amazon.com/cli/).

## Project setup

1. (Optional) Create your own `.envrc`. You can skip this step if you are not using direnv.
```
cp .envrc.template .envrc
```

2. You will require an AWS account that has permissions to create VPCs, subnets, RDS databases, S3 buckets and EC2 instances. Ensure you have an IAM account that has the necessary permissions to create and configure these services. If you are testing on a root account, I highly recommend you to create an IAM account for this purpose.

1. Generate an access key and update variables in `.envrc`. If you are not using direnv, setup accordingly.

1. You may also want to log into [AWS Console](https://console.aws.amazon.com/console/home) to observe the changes made by Terraform.

## Create resources on AWS
Initialize the working directory
```
terraform init
```

Review the changes that will be made.
```
terraform plan
```

Create resource on AWS

```
terraform apply
```
*Do keep an eye on the output.*

If you are experimenting with configurations, adding or removing resources. You will be using `terraform plan` and `terraform apply` repeatedly. You can also use `terraform validate` for a quick and local validatation of your changes.

When you are done and wish to delete all resources
```
terraform destroy
```

## Housekeeping
If you no longer wish to run this Terraform project. You may want to consider:

1. Deleting the AWS access key if it was generated only for the purpose of this project.
