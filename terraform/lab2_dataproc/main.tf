provider "google" {
  project = "qwiklabs-gcp-04-145910e5f794"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_dataproc_cluster" "mycluster" {
  name     = "example-cluster"
  region   = "global"
  graceful_decommission_timeout = "120s"
  cluster_config {
    worker_config {
      num_instances    = 2
    }	
  }
}
