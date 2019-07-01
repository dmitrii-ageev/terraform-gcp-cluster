resource "google_container_node_pool" "this" {
  provider = "google-beta"
  project  = "${var.project}"
  location = "${var.location}"

  name    = "${var.name}-node-pool"
  cluster = "${google_container_cluster.this.name}"

  node_count = "${var.initial_node_count}"

  lifecycle {
    ignore_changes = [
      "node_count",
    ]
  }

  management = {
    auto_repair  = "${var.auto_repair}"
    auto_upgrade = "${var.auto_upgrade}"
  }

  autoscaling {
    min_node_count = "${var.min_node_count}"
    max_node_count = "${var.max_node_count}"
  }

  node_config {
    disk_size_gb = "${var.disk_size_gb}"
    disk_type    = "${var.disk_type}"
    image_type   = "${var.image_type}"
    machine_type = "${var.machine_type}"
    preemptible  = "${var.preemptible}"

    oauth_scopes = "${var.oauth_scopes}"

    metadata {
      disable-legacy-endpoints = "true"
    }

    service_account = "${var.service_account}"
  }
}
