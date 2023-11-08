terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "< 5.0.0"
    }
  }

  backend "gcs" {
    prefix = "tf/networking"
    bucket = "876-remote-tfstate"
  }
}

provider "google" {
  # Configuration option
  
  region  = var.region
  project = var.project_id
}