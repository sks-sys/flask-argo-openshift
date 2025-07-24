variable "aws_region" {
  default = "us-east-1"
}

variable "key_name" {
  default = "gitlab-deployer-key"
}

variable "public_key_path" {
  default = "~/.ssh/id_rsa.pub"
}

variable "ami_id" {
  # Example Amazon Linux 2 AMI in us-east-1
  default = "ami-0c02fb55956c7d316"
}

variable "instance_type" {
  default = "t2.micro"
}
