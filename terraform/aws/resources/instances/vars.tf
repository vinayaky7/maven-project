variable "AWS_ACCESS_KEY" {
	default = "AKIAUVDNXNRZTGLOO5FI"
}

variable "AWS_SECRET_KEY" {
	default = "P052SlhYNawQ92M5R9lVg+lQVn9Q6ohFuJfCuRio"
}

variable "mykey" {
	type = string
	default = "radicaljan2023weekend12pm"
	
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
		    us-west-2a = "subnet-00ce114fc73a94b73"
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
    us-west-2 = "ami-0b029b1931b347543"
    eu-west-1 = "ami-0d729a60"
	  us-east-2 = "ami-0fa49cc9dc8d62c84"
  }

}


