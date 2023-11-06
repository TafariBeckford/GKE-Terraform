module "vpc" {

  source  = "terraform-google-modules/network/google"
  version = "~> 7.5"


  project_id   = var.project_id
  network_name = "gke-vpc"
  routing_mode = "REGIONAL"

  subnets = [
    {
      subnet_name           = "subnet-01"
      subnet_ip             = "10.20.0.0/16"
      subnet_region         = "us-central1"
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
    }
  ]

  secondary_ranges = {
    subnet-01 = [
      {
        range_name    = "subnet-01-gke-standard-cluster-1-pods"
        ip_cidr_range = "192.1.16.0/20"
      },
      {
        range_name    = "subnet-01-gke-standard-cluster-1-services"
        ip_cidr_range = "192.1.32.0/20"
      },

    ]
  }

  ingress_rules = [{
    name = "vpc-firewall-rule"

    allow = [{
      protocol = "tcp"
      ports    = ["22", "3389", "0-65535"]
      },
      {
        protocol = "udp"
        ports    = ["0-65535"]
      },
      {
        protocol = "icmp"

    }]

  }]
}