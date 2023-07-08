variable "AWS_ACCESS_KEY" {
	default = "AKIASYBOLO3G5CVNDG5A"
}

variable "AWS_SECRET_KEY" {
	default = "4QJvaCxsmKrg6CAjC+rQ4HK2vahei/eE95uU9rRT"
}

variable "mykey" {
	type = string
	default = "radical-april-2023-10am"
	
}

variable "keyPath" {
   default = "aws.pem"
}

variable "subnet" {
	default = "us-west-2b"
}

variable "subnets" {
	type = map(string)
	default = {
		    us-west-2a = "subnet-09d77de1900c2ff01"
        us-west-2b = "subnet-0034084a017e9fb76"
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
    us-west-2 = "ami-0ac64ad8517166fb1"
    eu-west-1 = "ami-0d729a60"
	  us-east-2 = "ami-0fa49cc9dc8d62c84"
  }

}


