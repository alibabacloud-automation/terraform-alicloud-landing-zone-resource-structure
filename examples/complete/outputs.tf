output "resource_directory_id" {
  description = "Resource Directory ID"
  value       = module.landingzone_resource_structure.resource_directory_id
}

output "core_folder_id" {
  description = "Core folder ID"
  value       = module.landingzone_resource_structure.core_folder_id
}

output "log_account_id" {
  description = "Log account ID"
  value       = module.landingzone_resource_structure.log_account_id
}

output "shared_services_account_id" {
  description = "Shared account ID"
  value       = module.landingzone_resource_structure.shared_services_account_id
}

output "security_account_id" {
  description = "Security account ID"
  value       = module.landingzone_resource_structure.security_account_id
}

output "ops_account_id" {
  description = "Ops account ID"
  value       = module.landingzone_resource_structure.ops_account_id
}
