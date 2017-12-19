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

variable "base-network-name" {
  default = "CaseyTerraform"
}

variable "ami" {
  default = "ami-a2e544da"

}
variable "instance_type" {
  default = "t2.micro"
}

variable "associate_public_ip_address" {
  default = "true"
}
