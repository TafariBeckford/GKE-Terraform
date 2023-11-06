data "terraform_remote_state" "bucket" {
  backend = "gcs"
  config = {
    prefix = "tf/networking"
    bucket = "876-remote-tfstate"
  }
}