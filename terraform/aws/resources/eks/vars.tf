variable "AWS_ACCESS_KEY" {
	default = "AKIA4TNG5PSZNJZYYOPX"
}

variable "AWS_SECRET_KEY" {
}

variable "subnet" {
	default = "us-east-2a"
}

variable "keyPath" {
   default = "aws.pem"
}

variable "subnet_id_1" {
  type = string
  default = "subnet-03ba9aad460bd47f6"
}
 
variable "subnet_id_2" {
  type = string
  default = "subnet-0c2e0b4c70b514deb"
}

variable "subnet_id_3" {
  type = string
  default = "subnet-011a5d9eb87abc3bd"
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
