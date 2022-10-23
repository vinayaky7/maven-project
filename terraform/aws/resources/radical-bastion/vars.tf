variable "AWS_ACCESS_KEY" {
	default = "AKIA3WQTCMOXINIFS7XW"
}

variable "AWS_SECRET_KEY" {
}

variable "mykey" {
	type = string
	default = "radical-devops-weekend-July-10am-2022"
	
}

variable "subnet" {
	default = "us-west-2a"
}

variable "security-group" {
	type = map(list(string))
	default = {
		"mysg" = ["sg-0180f84f7133bee9e"]
		
	}
}


variable "keyPath" {
   default = "aws.pem"
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

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-098e42ae54c764c35"
    eu-west-1 = "ami-0d729a60"
    us-east-2 = "ami-0fa49cc9dc8d62c84"
  }
}
