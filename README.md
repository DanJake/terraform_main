# Google Cloud Platform Project Demo3

# Terraform part one

## Compatibility

This project is meant for use with Terraform v0.12.20 and Google provider v3.8.0


### Resources
- `google_compute_firewall` allow icmp & http/https
- `google_compute_address` create External IP addresses for  instances
- `google_dns_record_set` crete DNS record for gitlab, sentry, flask app, jenkins
- `google_compute_disk` create disk for instances
- `google_compute_instance` create instances
- `google_compute_disk` create disk for instances

### Provisioner
- `installansible.sh` install ansible on Ansible machine
- `id_rsa.pub` Key forwarding on machines which managings Ansible

## Requirements

These sections describe requirements for using this file.

### Software

The following dependencies must be available:

- [Terraform][terraform] v0.12.20
- [Terraform Provider for GCP][terraform-provider-gcp] plugin = v3.8.0

### IAM
In order to execute this module you must have a Service Account with the
following roles:

Service account or user credentials with the following roles must be used to provision the resources of this module:


- Compute Admin: `roles/compute.admin`
- Compute Network Admin: `roles/compute.networkAdmin`
- DNS Administrator: `roles/dns.admin`
- Storage Admin: `roles/storage.admin`
- For monitoring:
  - Monitoring Editor: `roles/monitoring.editor`
  - Monitoring Metric Writer: `roles/monitoring.metricWriter`
  - Logs Writer: `roles/logging.logWriter`

  [terraform-provider-gcp]: https://www.terraform.io/docs/providers/google/index.html
  [terraform]: https://www.terraform.io/downloads.html
