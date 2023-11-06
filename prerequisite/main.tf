
resource "random_id" "bucket_prefix" {
  byte_length = 8
}

module "bucket" {
  source  = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  version = "~> 5.0"
  project_id  = var.project_id
  location = var.region
  name = "876-remote-tfstate"
  force_destroy = true
}