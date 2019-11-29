# Terraform EKS Docker Image

A Docker image to run the [terraform-aws-eks](https://github.com/terraform-aws-modules/terraform-aws-eks) in the context of a CI/CD Pipeline. Because of the module's reliance on `local-exec` deferring work to `kubectl` and `aws-iam-authenticator`, the official Hashicorp Terraform image cannot run it. This image builds on top of the [Hashicorp Terraform](https://hub.docker.com/r/hashicorp/terraform/) image and adds the missing binaries to run the `terraform-aws-eks` module.

## Setup and Prerequisites

- Have [Docker](https://docs.docker.com/install/) installed locally
- Have [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) installed locally

## Dependencies

- This image is built using the [Hashicorp Terraform](https://hub.docker.com/r/hashicorp/terraform/) image as a base.
- This image also compiled binaries for:
  - [Terraform](https://github.com/hashicorp/terraform)
  - [AWS' distribution of Kubectl](https://github.com/actions/aws/tree/master/kubectl)
  - [aws-iam-authenticator](https://github.com/kubernetes-sigs/aws-iam-authenticator)
  - [Helm](https://github.com/helm/helm)

[![Known Vulnerabilities](https://snyk.io/test/github/{username}/{repo}/badge.svg)](https://snyk.io/test/github/{username}/{repo}) 
