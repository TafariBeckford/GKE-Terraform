module "gke" {

  source                     = "terraform-google-modules/kubernetes-engine/google"
  version                    = "28.0.0"
  project_id                 = var.project_id
  name                       = "gke-cluster-876"
  regional                   = true
  region                     = var.region
  zones                      = ["us-central1-a", "us-central1-b"]
  network                    = "gke-vpc"
  subnetwork                 = "subnet-01"
  ip_range_pods              = "subnet-01-gke-standard-cluster-1-pods"
  ip_range_services          = "subnet-01-gke-standard-cluster-1-services"
  http_load_balancing        = false
  network_policy             = false
  horizontal_pod_autoscaling = true
  filestore_csi_driver       = false
  create_service_account     = true
  remove_default_node_pool   = true
  monitoring_enable_managed_prometheus = true

  node_pools = [
    {
      name               = "gke-node-pool"
      machine_type       = "e2-medium"
      node_locations     = "us-central1-a,us-central1-b"
      node_count         = 3
      min_count          = 1
      max_count          = 3
      initial_node_count = 1
      spot               = false
      disk_size_gb       = 20
      disk_type          = "pd-standard"
      image_type         = "COS_CONTAINERD"
      enable_gcfs        = false
      enable_gvnic       = false
      logging_variant    = "DEFAULT"
      auto_repair        = true
      auto_upgrade       = true
      preemptible        = false
    },
  ]
}