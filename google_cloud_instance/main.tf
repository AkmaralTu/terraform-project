resource "google_compute_instance" "first_google_instance" {
  name = "example-instance5588"
  machine_type = "e2-micro"  #instance_type
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"   #in aws is ami
    }
  }
  network_interface {
    network = "default"
    access_config {
      
    }
  }
}