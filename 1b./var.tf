variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "us-west-2"
}
variable "ami" {
  type = map(string)
  default = {
    "us-west-2" = "ami-04169656fea786776"
    "us-west-2" = "ami-006fce2a9625b177f"
  }
}

variable "instance_count" {
  default = "2"
}

variable "instance_type" {
  default = "t2.micro"
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
