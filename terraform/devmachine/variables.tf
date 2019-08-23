variable "instance_type" {
  type    = string
  default = "t3.xlarge"
}

variable "gpu_instance_type" {
  type    = string
  default = "g3s.xlarge"
}

variable "host" {
  type    = string
  default = "dev"
}

variable "zoneName" {
  type = string
}

variable "keyName" {
  type = string
}

variable "gpu" {
  type    = bool
  default = false
}

