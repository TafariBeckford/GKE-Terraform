resource "google_artifact_registry_repository" "my-repo" {
  location      = var.region
  repository_id = "image-repository-876"
  description   = "docker repository for gke"
  format        = "DOCKER"
}