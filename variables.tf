// Cluster settings
variable "name" {
  description = "Cluster name"
}

variable "labels" {
  description = "The GCE resource labels (a map of key/value pairs) to be applied to the cluster."
  default = {}
}

/*
   The location (region or zone) in which the cluster master will be created, as well as the default node location.
   If you specify a zone (such as us-central1-a), the cluster will be a zonal cluster with a single cluster master.
   If you specify a region (such as us-west1), the cluster will be a regional cluster with multiple masters spread
   across zones in the region, and with default node locations in those zones as well.
*/
variable "location" {
  description = "The location (region or zone) in which the cluster resides."
}

variable "master_ipv4_cidr_block" {
  description = "The IP range in CIDR notation to use for the hosted master network."
  default = ""
}

variable "cluster_ipv4_cidr_block" {
  description = "The IP address range for the cluster pod IPs."
  default = ""
}

variable "services_ipv4_cidr_block" {
  description = "The IP address range of the services IPs in this cluster."
  default = ""
}

variable "network" {
  description = "Cluster network"
}

variable "subnetwork" {
  description = "The name or self_link of the Google Compute Engine subnetwork in which the cluster's instances are launched."
}

variable "authorized_network" {
  description = "The network authorized for master access"
}

variable "authorized_network_name" {
  description = "The authorized network name"
}

variable "cluster_autoscaling" {
  description = "Whether cluster-wide autoscaling is enabled (i.e.node autoprovisioning is enabled)."
  default = false
}

variable "vertical_pod_autoscaling" {
  description = "Vertical Pod Autoscaling automatically adjusts the resources of pods controlled by it."
  default = false
}

variable "horizontal_pod_autoscaling" {
  description = "The status of the Horizontal Pod Autoscaling."
  default = false
}

variable "http_load_balancing" {
  description = "The status of the HTTP (L7) load balancing controller addon"
  default = false
}

variable "kubernetes_dashboard" {
  description = "The status of the Kubernetes Dashboard add-on, which controls whether the Kubernetes Dashboard is enabled for this cluster"
  default = false
}

variable "istio" {
  description = "The status of the Istio add-on"
  default = false
}

variable "image_type" {
  description = "The image type to use for this nodes"
  default = "COS"
}

variable "preemptible" {
  description = "A boolean that represents whether or not the underlying node VMs are preemptible"
  default = false
}

variable "daily_maintenance_window" {
  description = "When to start daily maintenance works."
  default = "00:00"
}

variable "database_encryption_key" {
  description = "The key to use to encrypt/decrypt secrets in ETCD."
  default = ""
}

variable "security_group" {
  description = "The name of the RBAC security group for use with Google security groups in Kubernetes RBAC. Group name must be in format gke-security-groups@yourdomain.com."
}

// Node pool
variable "service_account" {
  description = "A service account to associate with nodes."
}

variable "initial_node_count" {
  description = "The initial node count for the pool"
  default = 1
}

variable "min_node_count" {
  description = "If set, enables node pool downscale"
  default = ""
}

variable "max_node_count" {
  description = "If set, enables node pool autoscale"
  default = ""
}

variable "machine_type" {
  description = "Virtual machine type to use."
  default = "g1-small"
}

variable "disk_type" {
  description = "Type of the disk attached to each node."
  default = "pd-standard"
}

variable disk_size_gb {
  description = "Size of the disk attached to each node, specified in GB."
  default = 100
}

variable "oauth_scopes" {
  description = "The set of Google API scopes to be made available on all of the node VMs under the 'default' service account."

  //  "https://www.googleapis.com/auth/cloud-platform",

  default = [
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring",
  ]
}

variable "auto_upgrade" {
  description = "Whether the nodes will be automatically repaired"
  default = true
}

variable "auto_repair" {
  description = "Whether the nodes will be automatically repaired"
  default = true
}
