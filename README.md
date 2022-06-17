# Terraform Sharing

This project is created as part of a sharing session to introduce Terraform.
# Getting Started

The following instructions assume you are using macOS. If you are not using macOS, certain steps also come with alternate installations options. Otherwise, you can fallback on your on your experience and search_engine-fu.

## Prerequisites

### [Homebrew](https://brew.sh/)
Follow instructions on the (Homebrew homepage)(https://brew.sh/).

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

### [direnv](https://direnv.net/) (Optional)
```
brew install direnv
```
And follow instructions to complete setup. We use this to configure `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` and `AWS_DEFAULT_REGION`. This is optional and you get choose to configure via other methods such as [AWS CLI](https://aws.amazon.com/cli/).

## Project setup

1. (Optional) Create your own `.envrc`. You can skip this step if you are not using direnv.
```
cp .envrc.template .envrc
```

2. You will require permissions to create VPCs, subnets, RDS databases, S3 buckets and EC2 instances. Ensure you have a IAM account that has the necessary permissions to create and configure the services. If you are testing on a root account, do create a IAM account for this purpose.

1. Generate a access key and update variables in `.envrc`. If you are not using direnv, setup accordingly.

## RUN


## Housekeeping
If you no longer wish to run this Terraform project. You may want to consider:

1. Delete the AWS access key if it was generated only for the purpose of this project.
