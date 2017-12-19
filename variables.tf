variable "aws_region" {
  default = "us-west-2"
}

variable "account_ids" {
  type    = "list"
  default = ["057866020917"]
}

variable "environment" {
  default = "case9854-prod"
}
