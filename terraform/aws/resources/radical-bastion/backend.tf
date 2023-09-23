terraform {
  backend "s3" {                      # Define a remote bucket (AWS S3)
    bucket = "radical-june-weekend-12pm"       # Make sure the bucket is already created in your reqgion
    key    = "terraform.tfstate"    # Set the bucket key
    region = "us-east-1"            # Set the region where the bucket exists
  }
  
}
  