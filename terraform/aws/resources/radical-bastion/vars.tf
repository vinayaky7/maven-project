variable "AWS_ACCESS_KEY" {
	default = "AKIARDAKVDTYMPC2KPSA"
}

variable "AWS_SECRET_KEY" {
}

variable "mykey" {
	type = string
	default = "radicalnov2022weekend10am"
	
}

variable "subnet" {
	default = "us-west-2a"
}

variable "security-group" {
	type = map(list(string))
	default = {
		"mysg" = ["sg-05e6208821489e80a"]
		
	}
}


variable "keyPath" {
   default = "aws.pem"
}

variable "subnets" {
	type = map(string)
	default = {
		us-west-2a = "subnet-07c10b20a7fb70b45"
		us-west-2b = "subnet-02e8f731938e03cd3"
		us-west-2c = "subnet-02be228febb9095d7"
		us-west-2d = "subnet-098e9fded75939441"
	}
}


variable "AWS_REGION" {
  default = "us-west-2"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-094125af156557ca2"
    eu-west-1 = "ami-0d729a60"
    us-east-2 = "ami-0fa49cc9dc8d62c84"
  }
}
