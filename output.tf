output "gitlab" {
  value = element(google_dns_record_set.dnsrecord.*.name, 0)
}
output "jenkins" {
  value = element(google_dns_record_set.dnsrecord.*.name, 1)
}
output "sentry" {
  value = element(google_dns_record_set.dnsrecord.*.name, 2)
}
output "flask" {
  value = element(google_dns_record_set.dnsrecord.*.name, 3)
}
