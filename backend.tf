terraform {
  backend "gcs" {
    bucket      = "terraform_state_demo3"
    prefix      = "demo3/terraform.tfstate"
    credentials = "/home/rasavo99/Project.json"
  }
}
