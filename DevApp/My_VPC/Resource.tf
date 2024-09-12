terraform {
  required_version = ">=1.6.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.65.0"
    }
    randam = {
      source  = "hashicorp/aws"
      version = ">=5.0"

    }
  }
}

#Create vpc in us-east-1 region
provider "aws" {
  region  = "us-east-1"
  profile = "default"

}