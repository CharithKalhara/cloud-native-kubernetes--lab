terraform {
  backend "s3" {
    bucket         = "charith-terraform-state-396608776779-ap-southeast-1-an"
    key            = "cloud-native-kubernetes/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}