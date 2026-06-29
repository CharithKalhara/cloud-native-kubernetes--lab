terraform {
  backend "s3" {
    bucket         = "charith-terraform-state"
    key            = "cloud-native-kubernetes/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}