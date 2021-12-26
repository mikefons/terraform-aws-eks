terraform {
  required_version = ">= 0.13.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.56"
      region  = "us-east-1"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 1.4"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.1.0"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = ">= 2.0"
    }
    http = {
      source  = "terraform-aws-modules/http"
      version = ">= 2.4.1"
    }
  }
}
