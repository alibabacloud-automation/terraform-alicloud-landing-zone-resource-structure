output "resource_directory_id" {
  description = "The ID of the Resource Directory"
  value       = one(alicloud_resource_manager_resource_directory.master[*].id)
}

output "core_folder_id" {
  description = "The ID of the core folder"
  value       = alicloud_resource_manager_folder.core.id
}

output "log_account_id" {
  description = "The ID of the log account (if created)"
  value       = one(alicloud_resource_manager_account.log_archive[*].id)
}

output "shared_services_account_id" {
  description = "The ID of the shared services account (if created)"
  value       = one(alicloud_resource_manager_account.shared_services[*].id)
}

output "security_account_id" {
  description = "The ID of the security account (if created)"
  value       = one(alicloud_resource_manager_account.security[*].id)
}

output "ops_account_id" {
  description = "The ID of the ops account (if created)"
  value       = one(alicloud_resource_manager_account.ops[*].id)
}