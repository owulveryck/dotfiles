variable "host" {
  type    = "string"
  default = "dev"
}

variable "zoneName" {
  type = "string"
}

variable "keyName" {
  type = "string"
}

variable "deepLearningAMI" {
  type    = "string"
  default = "ami-0757fc5a639fe7666" # Deep Learning AMI (Ubuntu) Version 23.1
}
