terraform {
  backend "s3" {                      # Define a remote bucket (AWS S3)
    bucket = "radical-jan-weekdays-12pm"       # Make sure the bucket is already created in your reqgion
    key    = "terraform.tfstate"    # Set the bucket key
    region = "us-west-2"            # Set the region where the bucket exists
  }
  
}
  