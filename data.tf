data "google_client_config" "this" {}

data "google_container_engine_versions" "this" {
  location = "${var.location}"
}