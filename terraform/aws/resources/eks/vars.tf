variable "AWS_ACCESS_KEY" {
	default = "AKIA3WQTCMOXINIFS7XW"
}

variable "AWS_SECRET_KEY" {
}

variable "keyPath" {
   default = "aws.pem"
}

variable "subnet_id_1" {
  type = string
  default = "subnet-00eaa050085b7ad04"
}
 
variable "subnet_id_2" {
  type = string
  default = "subnet-02e8f731938e03cd3"
}

variable "subnet_id_3" {
  type = string
  default = "subnet-02be228febb9095d7"
}

variable "subnet_id_4" {
  type = string
  default = "subnet-0d5099c4599a1edf7"
}

variable "subnets" {
	type = map(string)
	default = {
		us-west-2a = "subnet-00eaa050085b7ad04"
		us-west-2b = "subnet-02e8f731938e03cd3"
		us-west-2c = "subnet-02be228febb9095d7"
    us-west-2d = "subnet-0d5099c4599a1edf7"
	}
}


variable "AWS_REGION" {
  default = "us-west-2"
}
