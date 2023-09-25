variable "AWS_ACCESS_KEY" {
	default = "AKIAZYNFTPBGDFVBM3MB"
}

variable "AWS_SECRET_KEY" {
	default = "1250RJZp3TvPBPayY16RbXH6vjo3vzkeyOQZais9"
}

variable "mykey" {
	type = string
	default = "demo"
	
}

variable "subnet" {
	default = "us-east-1b"
}

variable "security-group" {
	type = map(list(string))
	default = {
		"Demo-SG" = ["sg-0e9c8799152d2054a"]
		
	}
}


variable "keyPath" {
   default = "aws.pem"
}

variable "subnets" {
	type = map(string)
	default = {
		us-east-1b = "subnet-063341b49a740071e"
		us-east-1a = "subnet-0f99e739329404012"
	}
}


variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-00c6177f250e07ec1"
    us-west-2 = "ami-0ac64ad8517166fb1"
    eu-west-1 = "ami-0d729a60"
    us-east-2 = "ami-0fa49cc9dc8d62c84"
  }
}
