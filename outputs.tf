output "name" {
  description = "The name of the cluster"
  value       = "${google_container_cluster.this.name}"
}

output "endpoint" {
  description = "The endpoint address of the cluster"
  value       = "${google_container_cluster.this.endpoint}"
}

output "region" {
  description = "The region where the cluster resides"
  value       = "${google_container_cluster.this.region}"
}

output "cluster_ca_certificate" {
  description = "The CA certificate of the cluster"
  value       = "${google_container_cluster.this.master_auth.0.cluster_ca_certificate}"
}
