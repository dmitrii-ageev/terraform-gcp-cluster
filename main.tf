resource "google_container_cluster" "this" {
  provider = "google-beta"
  location = "${var.location}"

  name = "${var.name}-cluster"

  remove_default_node_pool = true
  initial_node_count = "${var.initial_node_count}"

  logging_service = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"

  network = "${var.network}"
  subnetwork = "${var.subnetwork}"

  // https://cloud.google.com/kubernetes-engine/docs/reference/rest/v1beta1/projects.locations.clusters#Cluster.DatabaseEncryption

  resource_labels = "${var.labels}"
  authenticator_groups_config {
    security_group = "${var.security_group}"
  }
  database_encryption {
    state = "${var.database_encryption_key == "" ? "DECRYPTED" : "ENCRYPTED"}"
    key_name = "${var.database_encryption_key}"
  }
  cluster_autoscaling {
    enabled = "${var.cluster_autoscaling}"
  }
  vertical_pod_autoscaling = "${var.vertical_pod_autoscaling}"
  addons_config = {
    horizontal_pod_autoscaling = {
      disabled = "${!var.horizontal_pod_autoscaling}"
    }

    http_load_balancing = {
      disabled = "${var.http_load_balancing}"
    }

    kubernetes_dashboard = {
      disabled = "${var.kubernetes_dashboard}"
    }

    istio_config = {
      disabled = "${var.istio}"
    }
  }
  lifecycle {
    ignore_changes = [
      "min_master_version",
      "initial_node_count",
      "network_policy",
      "node_config",
      "node_pool",
    ]
  }
  maintenance_policy {
    daily_maintenance_window {
      start_time = "${var.daily_maintenance_window}"
    }
  }
  # The empty values here disable passwords rather than set an empty one.
  # https://www.terraform.io/docs/providers/google/r/container_cluster.html#password
  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }

    password = ""
    username = ""
  }
  master_authorized_networks_config = {
    cidr_blocks = {
      cidr_block = "${var.authorized_network}"
      display_name = "${var.authorized_network_name}"
    }
  }
  ip_allocation_policy = {
    cluster_ipv4_cidr_block = "${var.cluster_ipv4_cidr_block}"
    services_ipv4_cidr_block = "${var.services_ipv4_cidr_block}"
  }
  private_cluster_config = {
    enable_private_endpoint = false
    enable_private_nodes = true
    master_ipv4_cidr_block = "${var.master_ipv4_cidr_block}"
  }
}
