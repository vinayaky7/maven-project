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

variable "subnet" {
	default = "us-west-2a"
}

variable "security-group" {
	type = map(list(string))
	default = {
		"mysg" = ["sg-0983b096a0db56db8"]
		
	}
}


variable "keyPath" {
   default = "aws.pem"
}

variable "subnets" {
	type = map(string)
	default = {
		us-west-2a = "subnet-09d77de1900c2ff01"
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
    us-west-2 = "ami-0ac64ad8517166fb1"
    eu-west-1 = "ami-0d729a60"
    us-east-2 = "ami-0fa49cc9dc8d62c84"
  }
}
