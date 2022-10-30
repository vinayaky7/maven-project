variable "AWS_ACCESS_KEY" {
	default = "AKIASMHI2VDZNYVXGC7X"
}

variable "AWS_SECRET_KEY" {
}

variable "mykey" {
	type = string
	default = "radical-devops-weekend-Aug-2022-12pm"
	
}

variable "subnet" {
	default = "us-west-2a"
}

variable "security-group" {
	type = map(list(string))
	default = {
		"mysg" = ["sg-071207ac18219066e"]
		
	}
}


variable "keyPath" {
   default = "aws.pem"
}

variable "subnets" {
	type = map(string)
	default = {
		us-west-2a = "subnet-0f4c6ea0f186845c3"
		us-west-2b = "subnet-02e8f731938e03cd3"
		us-west-2c = "subnet-02be228febb9095d7"
		us-west-2d = "subnet-0d5099c4599a1edf7"
	}
}


variable "AWS_REGION" {
  default = "us-west-2"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-0c2ab3b8efb09f272"
    eu-west-1 = "ami-0d729a60"
    us-east-2 = "ami-0fa49cc9dc8d62c84"
  }
}
