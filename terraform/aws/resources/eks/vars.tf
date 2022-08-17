variable "AWS_ACCESS_KEY" {
	default = "AKIA2UM2VMALNDWX6RG3"
}

variable "AWS_SECRET_KEY" {
}

variable "keyPath" {
   default = "aws.pem"
}

variable "subnet_id_1" {
  type = string
  default = "subnet-058b3d997939b0f22"
}
 
variable "subnet_id_2" {
  type = string
  default = "subnet-042528506f3d17250"
}

variable "subnet_id_3" {
  type = string
  default = "subnet-0247e041dfb7aa47c"
}

variable "subnet_id_4" {
  type = string
  default = "subnet-0ac6d0d2348ff66c4"
}

variable "subnets" {
	type = map(string)
	default = {
		us-west-2a = "subnet-058b3d997939b0f22"
		us-west-2b = "subnet-042528506f3d17250"
		us-west-2c = "subnet-0247e041dfb7aa47c"
    us-west-2d = "subnet-0ac6d0d2348ff66c4"
	}
}


variable "AWS_REGION" {
  default = "us-west-2"
}
