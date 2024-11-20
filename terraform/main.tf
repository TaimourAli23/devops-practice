terraform {
  backend "s3" {
    bucket = "terraform-state-practice-bucket"   # The name of your S3 bucket
    key = "terraform/state/terraform.tfstate" # The path to the state file in the bucket
    region = "us-east-1"                         # AWS region where the bucket is located
    encrypt = true                                # Enable encryption for state file
    #     dynamodb_table = "terraform-lock-table"         # DynamoDB table for state locking
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
