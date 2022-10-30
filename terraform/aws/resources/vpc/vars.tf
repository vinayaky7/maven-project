variable "AWS_ACCESS_KEY" {
	default = "AKIASMHI2VDZNYVXGC7X"
}

variable "AWS_SECRET_KEY" {
	default = "AKIA3WQTCMOXINIFS7XW"
}

variable "vpc_cidr" {
	description = "CIDR for radical VPC"
	default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
	description = "CIDR for radical public subnet"
	default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
	description = "CIDR for radical private subnet"
	default     = "10.0.2.0/24"
}

variable "mykey" {
	type = string
	default = "radical-devops-weekend-Aug-2022-12pm"
	
}

variable "keyPath" {
   default = "aws.pem"
}

variable "subnet_public" {
	default = "us-west-2a"
}

variable "subnet_private" {
	default = "us-west-2b"
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
    us-west-2 = "ami-0cea098ed2ac54925"
    eu-west-1 = "ami-0d729a60"
	us-east-2 = "ami-0fa49cc9dc8d62c84"
  }

}


