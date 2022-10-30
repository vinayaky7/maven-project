variable "AWS_ACCESS_KEY" {
	default = "AKIASMHI2VDZNYVXGC7X"
}

variable "AWS_SECRET_KEY" {
	default = "XXXXXYYYYYXX"
}

variable "mykey" {
	type = string
	default = "radical-devops-weekend-Aug-2022-12pm"
	
}

variable "keyPath" {
   default = "aws.pem"
}

variable "subnet" {
	default = "us-west-2a"
}

variable "subnets" {
	type = map(string)
	default = {
		us-west-2a = "subnet-0f4c6ea0f186845c3"
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
    us-west-2 = "ami-0cea098ed2ac54925"
    eu-west-1 = "ami-0d729a60"
	us-east-2 = "ami-0fa49cc9dc8d62c84"
  }

}


