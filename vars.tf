//some vars to be called later
variable "region" {
  type = "string"
  default = "eu-west-1"
}

variable "ami-id" {
  default = "ami-0211a849817dcceca"
}

variable "ec2-size" {
  default = "t2.micro"
}