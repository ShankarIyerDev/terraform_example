output "resource_name" {
  description = "The evaluated and generated name for a resource. Valid types are 'virtual_machine', 'key_vault', and 'storage_account.'"
  value       = local.resource_name
}
