locals {
  cluster_ipv4_cidr_block = {
    australia-southeast1 = "10.12.0.0/14"
    us-central1 = "10.16.0.0/14"
    us-west2 = "10.20.0.0/14"
    us-east1 = "10.24.0.0/14"
  }

  services_ipv4_cidr_block = {
    australia-southeast1 = "10.196.0.0/20"
    us-central1 = "10.196.16.0/20"
    us-west2 = "10.196.32.0/20"
    us-east1 = "10.196.48.0/20"
  }

  master_ipv4_cidr_block = {
    australia-southeast1 = "192.168.101.0/28"
    us-central1 = "192.168.111.0/28"
    us-west2 = "192.168.121.0/28"
    us-east1 = "192.168.131.0/28"
  }
}