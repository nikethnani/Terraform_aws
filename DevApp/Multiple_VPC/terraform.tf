terraform {
  required_version =">=1.6.5"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">=5.0"
    }
    randam = {
        source = "hashicorp/aws"
        version = ">=5.0"

    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "default"

}

provider "aws" {
  region = "us-west-1"
  profile = "default"
  alias = "aws-west-1"
  
}
 


  

