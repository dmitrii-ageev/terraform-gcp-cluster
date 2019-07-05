locals {
  gke_service_account = "service-${data.google_project.this.number}@container-engine-robot.iam.gserviceaccount.com"
}
