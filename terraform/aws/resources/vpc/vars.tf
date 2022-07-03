variable "AWS_ACCESS_KEY" {
	default = "AKIA4TNG5PSZNJZYYOPX"
}

variable "AWS_SECRET_KEY" {
	default = "AKIA4TNG5PSZNJZYYOPX"
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

variable "security-group" {
	type = map(list(string))
	default = {
		"mysg" = ["sg-0946003082685286d"]
		
	}
}

variable "mykey" {
	type = string
	default = "radical-devops-march-2022-oregon"
	
}

variable "subnet" {
	default = "subnet1"
}

variable "subnets" {
	type = map(string)
	default = {
		subnet1 = "subnet-0ac5cad04768a6894"
		subnet2 = "subnet-08607b193ddc28364"
		subnet3 = "subnet-082e9a36b73ccb48e"
		subnet4 = "subnet-0713177bcf2516c8b"
	}
}


variable "AWS_REGION" {
  default = "us-west-2"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-0ca285d4c2cda3300"
    eu-west-1 = "ami-0d729a60"
  }

}


