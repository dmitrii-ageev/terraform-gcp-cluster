GCP CLUSTER TERRAFORM MODULE
============================

A terraform module to create a Google Kubernetes Engine (GKE) cluster.


Module Input Variables
----------------------

| Parameter         | Description                                   | Default        |
| :--------         | :----------                                   | :------        |
| `name`            | The cluster name                              |  _mandatory_   |
| `project`         | The Google Project Id where cluster belongs   |  _mandatory_   |
| `location`        | The location (region or zone) in which the cluster resides |  _mandatory_   |
| `network`         | The cluster network                           |  _mandatory_   |
| `subnetwork`      | The name or self_link of the Google Compute Engine subnetwork in which the cluster's instances are launched |  _mandatory_   |
| `authorized_network` | The network authorized for master access   |  _mandatory_   |
| `authorized_network_name` | The authorized network name           |  _mandatory_   |
| `security_group`  | The name of the RBAC security group for use with Google security groups in Kubernetes RBAC |  _mandatory_   |
| `service_account` | A service account to associate with nodes     |  _mandatory_   |
| `master_ipv4_cidr_block`   | The IP range in CIDR notation to use for the hosted master network | _mandatory_ |
| `cluster_ipv4_cidr_block`  | The IP address range for the cluster pod IPs | `""` |
| `services_ipv4_cidr_block` | The IP address range of the services IPs in this cluster | `""` |
| `labels`          | The GCE resource labels (a map of key/value pairs) to be applied to the cluster | `{}` |
| `cluster_autoscaling` | Whether cluster-wide autoscaling is enabled (i.e.node autoprovisioning is enabled) | `false` |
| `horizontal_pod_autoscaling` | The status of the Horizontal Pod Autoscaling | `false` |
| `http_load_balancing` | The status of the HTTP (L7) load balancing controller addon | `false` |
| `kubernetes_dashboard` | The status of the Kubernetes Dashboard addon, which controls whether the Kubernetes Dashboard is enabled for this cluster | `false` |
| `istio` | The support of the Istio addon | `false` |
| `preemptible` | A boolean that represents whether or not the underlying node VMs are preemptible | `false` |
| `daily_maintenance_window` | When to start daily maintenance works | `00:00` |
| `database_encryption_key` | The key to use to encrypt/decrypt secrets in ETCD | `""` |
| `security_group` | The name of the RBAC security group for use with Google security groups in Kubernetes RBAC. Group name must be in format gke-security-groups@yourdomain.com | `""` |
| `initial_node_count` | The initial node count for the pool | `1` |
| `min_node_count` | If set, enables node pool downscale | `""` |
| `max_node_count` | If set, enables node pool autoscale | `""` |
| `machine_type` | Virtual machine type to use | `g1-small` |
| `disk_type`    | Type of the disk attached to each node  | `pd-standard` |
| `disk_size_gb` | Size of the disk attached to each node, specified in GB. | `100` |
| `oauth_scopes` | The set of Google API scopes to be made available on all of the node VMs under the 'default' service account. | `[ "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring" ]` |
| `auto_upgrade` | Whether the nodes will be automatically repaired | `true` |
| `auto_repair`  | Whether the nodes will be automatically repaired | `true` |


Usage
-----

*Note:*
With Terraform versions prior to 0.11.14 use the module versions up to 1.9.99
With Terraform version 0.12.0 and higher use module versions starting from 2.0.0

```hcl
module "cluster" {
  source = "git::git@github.com:dmitrii-ageev/terraform-gcp-cluster?ref=0.0.7"

  name     = "terraform-storage-production"
  location = "us-east1-a"

  network    = "${module.vpc.network}"
  subnetwork = "${module.vpc.subnetwork}"

  authorized_network      = "${var.office_network}"
  authorized_network_name = "${var.office_network_name}"

  security_group = "gke-security-groups@yourdomain.com."
  service_account = "${var.service_account}"

  labels = {
    application = "terraform"
    environment = "production"
  }
}
```


Module Output Variables
-----------------------

| Parameter                | Description                                                  |
| :--------                | :----------                                                  |
| `name`                   | The name of the cluster                                      |
| `endpoint`               | The endpoint address of the cluster                          |
| `region`                 | The region where the cluster resides                         |
| `cluster_ca_certificate` | The CA certificate of the cluster                            |


Changelog
---------

* `0.0.8` - Fix Terraform validate warnings

Author
------

Dmitrii Ageev <d.ageev@gmail.com>
