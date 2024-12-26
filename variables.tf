variable "enable_resource_directory" {
  description = "Whether to enable the resource directory. Set to true to enable, false to skip."
  type        = bool
  default     = true
}

variable "core_folder_name" {
  description = "The name of the core folder, used to store core accounts."
  type        = string
  default     = "Core"
}

variable "log_archive_account" {
  description = <<-EOT
Log archive account:
- name: if null/empty => not created (though typically this one is mandatory).
- account_name_prefix: if empty, fallback to name.
- abandon_able_check_id: list of strings to ignore on deletion.
- financial_mode: choose between "Trusteeship" and "Self-pay". Default is "Trusteeship".
- payer_account_id: the payer account ID if using financial hosting. If not provided, use current account ID.
EOT
  type = object({
    name                  = string
    account_name_prefix   = optional(string, null)
    abandon_able_check_id = optional(list(string), [])
    financial_mode        = optional(string, "Trusteeship")
    payer_account_id      = optional(string, null)
  })
  default = {
    name           = "DefaultLogArchiveAccount"
    financial_mode = "Trusteeship"
  }
}

variable "shared_services_account" {
  description = <<-EOT
Shared services account:
- name: if null/empty => not created
- account_name_prefix: if empty => fallback to name
- abandon_able_check_id: list of strings to ignore on deletion
- financial_mode: choose between "Trusteeship" and "Self-pay". Default is "Trusteeship".
- payer_account_id: the payer account ID if using financial hosting. If not provided, use current account ID.
EOT
  type = object({
    name                  = string
    account_name_prefix   = optional(string, null)
    abandon_able_check_id = optional(list(string), null)
    financial_mode        = optional(string, "Trusteeship")
    payer_account_id      = optional(string, null)
  })
  default = {
    name = null
  }
}

variable "security_account" {
  description = <<-EOT
Security account:
- name: if null/empty => not created
- account_name_prefix: if empty => fallback to name
- abandon_able_check_id: list of strings to ignore on deletion
- financial_mode: choose between "Trusteeship" and "Self-pay". Default is "Trusteeship".
- payer_account_id: the payer account ID if using financial hosting. If not provided, use current account ID.
EOT
  type = object({
    name                  = string
    account_name_prefix   = optional(string, null)
    abandon_able_check_id = optional(list(string), [])
    financial_mode        = optional(string, "Trusteeship")
    payer_account_id      = optional(string, null)
  })
  default = {
    name = null
  }
}

variable "ops_account" {
  description = <<-EOT
Ops account:
- name: if null/empty => not created
- account_name_prefix: if empty => fallback to name
- abandon_able_check_id: list of strings to ignore on deletion
- financial_mode: choose between "Trusteeship" and "Self-pay". Default is "Trusteeship".
- payer_account_id: the payer account ID if using financial hosting. If not provided, use current account ID.
EOT
  type = object({
    name                  = string
    account_name_prefix   = optional(string, null)
    abandon_able_check_id = optional(list(string), [])
    financial_mode        = optional(string, "Trusteeship")
    payer_account_id      = optional(string, null)
  })
  default = {
    name = null
  }
}
