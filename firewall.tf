// Enable internal ICMP communication
resource "google_compute_firewall" "allow-internal-icmp" {
  name = "${var.name}-${var.location}-allow-internal-icmp"
  network = "${var.network}"

  allow {
    protocol = "icmp"
  }
}

/*
resource "google_compute_firewall" "allow-internal-db" {
  name    = "${var.name}-${var.location}-allow-internal-db"
  network = "${var.network}"

  allow {
    protocol = "tcp"

    ports = [
      "3306",
    ]
  }
}
*/
