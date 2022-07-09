variable "AWS_ACCESS_KEY" {
	default = "AKIA4TNG5PSZNJZYYOPX"
}

variable "AWS_SECRET_KEY" {
}

variable "mykey" {
	type = string
	default = "radical-devops-April-Ohio-12pm"
	
}

variable "subnet" {
	default = "us-east-2a"
}

variable "subnets" {
	type = map(string)
	default = {
		us-east-2a = "subnet-011a5d9eb87abc3bd"
		us-east-2b = "subnet-0e250c0a13ae1c6ab"
		us-east-2c = "subnet-03ba9aad460bd47f6"
	}
}


variable "AWS_REGION" {
  default = "us-east-2"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-0ca285d4c2cda3300"
    eu-west-1 = "ami-0d729a60"
	us-east-2 = "ami-0fa49cc9dc8d62c84"
  }
}
