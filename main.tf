provider "aws" {
  allowed_account_ids = "${var.account_ids}"
  region              = "${var.aws_region}"
}

terraform {
  backend "s3" {
    bucket  = "case9854-terraform"
    key     = "terraform.tfstate"
    encrypt = "true"
  }
}
