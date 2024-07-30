terraform {
  backend "s3" {
    bucket         = "demo-rakbank-tfstate-bucket"
    key            = "terraform/state/eks-cluster/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "demo-rakbank-tf-lock-table"
  }
}
