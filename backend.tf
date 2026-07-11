terraform {
  backend "s3" {
    bucket = "terraform-aws-setup4406"
    key = "terraform-project/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
    use_lockfile = true
  }
}