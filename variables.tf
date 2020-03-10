variable "credentials_file" {
  description = "Path to the service account key file in JSON format"
  type        = string
}
variable "project" {
  description = "The ID of the project"
  type        = string
}
variable "region" {
  description = "Default project region"
  default     = "europe-west4"
}
variable "zone" {
  description = "Default project zone"
  default     = "europe-west4-b"
}
variable "firewall_name" {
  description = "Name for firewall rule"
  default     = "web-firewall"
}
variable "network_name" {
  description = "The default zone to manage resources in"
  default     = "default"
}
variable "static_ip" {
  description = "This is static_ip setings for instances(name and region)"
  type = list(object({
    name   = string
    region = string
  }))
}
variable "network_tier" {
  description = "The networking tier used for configuring this address."
  default     = "STANDARD"
}
variable "dns_record" {
  description = "The DNS name for instances"
  type = list(object({
    name = string
  }))
}
variable "dns_name" {
  description = "The DNS name of the project"
  type        = string
}
variable "dns_type" {
  description = "The DNS record set type"
  default     = "A"
}
variable "dns_ttl" {
  description = "TThe time-to-live of this record set (seconds)"
  default     = 300
}
variable "dns_zone_name" {
  description = "The name of the zone in which this record set will reside"
  type        = string
}
variable "default_disk" {
  description = "This is default disk setings for instances (his name and zone)"
  type = list(object({
    name = string
    zone = string
  }))
}
variable "disk_type" {
  description = "URL of the disk type resource describing which disk type to use to create the disk(pd-standard or pd-ssd)"
  default     = "pd-standard"
}
variable "disk_image" {
  description = " The image from which to initialize this disk"
  default     = "ubuntu-os-cloud/ubuntu-1804-lts"
}
variable "disk_size" {
  description = "Size of the persistent disk, specified in GB"
  default     = 25
}
variable "instance" {
  description = "A unique name for the resource and zone that the machine should be created in"
  type = list(object({
    name = string
    zone = string
  }))
}
variable "machine_type" {
  description = "The machine type to create"
  default     = "n1-standard-2"
}
variable "firewall_web" {
  description = "Firewall tag name for icmp and tcp[80,443] protocols"
  default     = "web"
}
variable "home_dir" {
  description = "Home user directory"
  type        = string
}
variable "instance_ansible_name" {
  description = "A unique name for the ansible resource"
  default     = "terraform-ansible"
}

variable "instance_ansible_zone" {
  description = "zone that the ansible machine should be created in"
  default     = "europe-west4-b"
}
variable "connection_type" {
  description = "The connection type that should be used. Valid types are ssh and winrm"
  default     = "ssh"
}
variable "agent_ssh" {
  description = "Using ssh-agent or not"
  default     = "false"
}
variable "user_name" {
  description = "The user that we should use for the connection"
  type        = string
}
variable "p_key" {
  description = "The path of an SSH key to use for the connection"
  type        = string
}
variable "vault_key" {
  description = "The path of an vault key to use for the connection"
  type        = string
}
