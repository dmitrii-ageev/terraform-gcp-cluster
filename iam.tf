// Grant access to the encryption key for the GKE service account
resource "google_kms_crypto_key_iam_member" "gke_service_account" {
  count         = var.database_encryption_key == "" ? 0 : 1
  crypto_key_id = var.database_encryption_key

  // role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  role   = "roles/owner"
  member = "serviceAccount:${local.gke_service_account}"
}
