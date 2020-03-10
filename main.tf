provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project
  region      = var.region
  zone        = var.zone
}
# ----------Static IP-----------------------
resource "google_compute_address" "static-ip-address" {
  count        = length(var.static_ip)
  name         = var.static_ip[count.index].name
  region       = var.static_ip[count.index].region
  network_tier = var.network_tier
}

# -----------------Dns records--------------
resource "google_dns_record_set" "dnsrecord" {
  count        = length(var.dns_record)
  name         = "${var.dns_record[count.index].name}.${var.dns_name}"
  type         = var.dns_type
  ttl          = var.dns_ttl
  managed_zone = var.dns_zone_name
  rrdatas      = [element(google_compute_address.static-ip-address.*.address, count.index)]
}
resource "google_dns_record_set" "registry" {

  name         = "registry.${var.dns_record[0].name}.${var.dns_name}"
  type         = var.dns_type
  ttl          = var.dns_ttl
  managed_zone = var.dns_zone_name
  rrdatas      = [element(google_compute_address.static-ip-address.*.address, 0)]
}

resource "google_compute_disk" "def_disk" {
  count = length(var.default_disk)
  name  = var.default_disk[count.index].name
  type  = var.disk_type
  image = var.disk_image
  zone  = var.default_disk[count.index].zone
  size  = var.disk_size
}
#-------------------Firewall------------------
resource "google_compute_firewall" "default" {
  name    = var.firewall_name
  network = var.network_name

  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web"]
}
# -------------------------Instances ---------------
resource "google_compute_instance" "instances" {
  count        = length(var.instance)
  name         = var.instance[count.index].name
  machine_type = var.machine_type
  zone         = var.instance[count.index].zone
  tags         = [var.firewall_web]

  boot_disk {
    source = element(google_compute_disk.def_disk.*.name, count.index)
  }
  network_interface {
    network = var.network_name
    access_config {
      nat_ip       = element(google_compute_address.static-ip-address.*.address, count.index)
      network_tier = var.network_tier
    }
  }
  metadata = {
    ssh-keys = "${var.user_name}:${file("./files/id_rsa.pub")}"
  }
  metadata_startup_script = "apt install -y python"

}

resource "google_compute_instance" "ansible" {
  name         = var.instance_ansible_name
  machine_type = var.machine_type
  zone         = var.instance_ansible_zone

  boot_disk {
    source = element(google_compute_disk.def_disk.*.name, 4)
  }
  network_interface {
    network = var.network_name
    access_config {
      network_tier = var.network_tier
      nat_ip       = element(google_compute_address.static-ip-address.*.address, 4)
    }
  }
  metadata = {
    ssh-keys = "${var.user_name}:${file("./files/id_rsa.pub")}"
  }

  provisioner "file" {
    source      = "~/.ssh/${var.vault_key}"
    destination = "~/${var.vault_key}"

    connection {
      type        = var.connection_type
      user        = var.user_name
      private_key = file("${var.home_dir}/${var.p_key}")
      agent       = var.agent_ssh
      host        = element(google_compute_address.static-ip-address.*.address, 4)
    }
  }
  provisioner "file" {
    source      = "./scripts/installansible.sh"
    destination = "installansible.sh"

    connection {
      type        = var.connection_type
      user        = var.user_name
      private_key = file("~/${var.p_key}")
      agent       = var.agent_ssh
      host        = element(google_compute_address.static-ip-address.*.address, 4)
    }
  }
  metadata_startup_script = "chmod u+x ${var.home_dir}/installansible.sh && ${var.home_dir}/./installansible.sh"
}
