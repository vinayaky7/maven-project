variable "AWS_ACCESS_KEY" {
	default = "AKIA2UM2VMALNDWX6RG3"
}

variable "AWS_SECRET_KEY" {
}

variable "mykey" {
	type = string
	default = "radical-devops-weekdays-June-2022"
	
}

variable "subnet" {
	default = "us-west-2a"
}

variable "keyPath" {
   default = "aws.pem"
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

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-098e42ae54c764c35"
    eu-west-1 = "ami-0d729a60"
    us-east-2 = "ami-0fa49cc9dc8d62c84"
  }
}
