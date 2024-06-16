terraform {
  backend "s3" {
    bucket         = "pawsclaws-s3-bucket-yuan"
    key            = "global/s3/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "pawsclaws-terraform-lock-table-yuan"
    encrypt        = true
  }
}