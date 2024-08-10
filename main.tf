# Create a VM instance
resource "google_compute_instance" "vm_instance" {
  name         = "onehub-prod"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  # Specify the boot disk
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"  # Using Debian 11 as the base image
    }
  }

  # Network interface
  network_interface {
    network = "default"

    access_config {
      # Ephemeral IP will be assigned
    }
  }

  # Metadata for startup script to install Git and clone the GitHub repo
  metadata = {
    startup-script = <<-EOF
      #!/bin/bash
      sudo apt-get update -y
      sudo apt install -y python3 python3-pip
      sudo apt-get install -y apache2
      sudo apt install certbot python3-certbot-apache
      git clone 
    EOF
  }

  # Tags to allow HTTP/HTTPS traffic (optional)
  tags = ["http-server", "https-server"]

  # Service account with necessary scopes (optional, adjust as needed)
  service_account {
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}

# Optional: Firewall rules to allow HTTP/HTTPS traffic (if not already set up)
resource "google_compute_firewall" "default" {
  name    = "default-allow-http-https"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server", "https-server"]
}



# Create a VM instance
resource "google_compute_instance" "vm_instance" {
  name         = "onehub-prod"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  # Specify the boot disk
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"  # Using Debian 11 as the base image
    }
  }

  # Network interface
  network_interface {
    network = "default"

    access_config {
      # Ephemeral IP will be assigned
    }
  }

  # Metadata for startup script to install Git and clone the GitHub repo
  metadata = {
    startup-script = <<-EOF
      #!/bin/bash
      sudo apt-get update -y
      sudo apt install -y python3 python3-pip
      sudo apt-get install -y apache2
      sudo apt install certbot python3-certbot-apache
      git clone 
    EOF
  }

  # Tags to allow HTTP/HTTPS traffic (optional)
  tags = ["http-server", "https-server"]

  # Service account with necessary scopes (optional, adjust as needed)
  service_account {
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}

# Optional: Firewall rules to allow HTTP/HTTPS traffic (if not already set up)
resource "google_compute_firewall" "default" {
  name    = "default-allow-http-https"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server", "https-server"]
}

