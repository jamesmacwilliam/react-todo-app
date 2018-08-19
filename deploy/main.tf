terraform {
  required_version = ">= 0.11.7"
}

provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer"
  public_key = "${file("${var.public_key_path}")}"
}
