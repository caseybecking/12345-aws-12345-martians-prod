provider "aws" {
  allowed_account_ids = "${var.account_ids}"
  region              = "${var.aws_region}"
}

module "base-network" {
  source      = "base-network"
  environment = "CaseyProduction"
  name        = "${var.base-network-name}"
}

terraform {
  backend "s3" {
    bucket  = "case9854-terraform"
    key     = "terraform.tfstate"
    encrypt = "true"
    region  = "us-west-2"
  }
}

resource "aws_instance" "caseyServer" {
    ami = "${var.ami}"
    instance_type = "${var.instance_type}"
    # subnet_id = "${module.base-network.public_subnets[0]}"
    subnet_id = "${element(module.base-network.public_subnets, count.index)}"
    vpc_security_group_ids = ["${aws_security_group.FrontEnd.id}"]
    associate_public_ip_address = "${var.associate_public_ip_address}"

    tags {
      Name = "${var.environment}-web${count.index}"
    }
    user_data = "${file("bootstrap.sh")}"

    count = 4
}
