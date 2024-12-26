data "alicloud_account" "current_account" {}

resource "alicloud_resource_manager_resource_directory" "master" {
  count                  = var.enable_resource_directory ? 1 : 0
  member_deletion_status = "Enabled"
}

resource "alicloud_resource_manager_folder" "core" {
  folder_name = var.core_folder_name

  depends_on = [
    alicloud_resource_manager_resource_directory.master
  ]
}

locals {
  log_archive_account_prefix = (
    var.log_archive_account.account_name_prefix != null
  ) ? var.log_archive_account.account_name_prefix : var.log_archive_account.name

  log_archive_account_payer_account_id = (
    var.log_archive_account.financial_mode == "Self-pay"
    ? null
    : (
      var.log_archive_account.financial_mode == "Trusteeship" && var.log_archive_account.payer_account_id != null
      ? var.log_archive_account.payer_account_id
      : data.alicloud_account.current_account.id
    )
  )

  shared_services_account_prefix = (
    var.shared_services_account.account_name_prefix != null
  ) ? var.shared_services_account.account_name_prefix : var.shared_services_account.name

  shared_services_account_payer_account_id = (
    var.shared_services_account.financial_mode == "Self-pay"
    ? null
    : (
      var.shared_services_account.financial_mode == "Trusteeship" && var.shared_services_account.payer_account_id != null
      ? var.shared_services_account.payer_account_id
      : data.alicloud_account.current_account.id
    )
  )

  security_account_prefix = (
    var.security_account.account_name_prefix != null
  ) ? var.security_account.account_name_prefix : var.security_account.name

  security_account_payer_account_id = (
    var.security_account.financial_mode == "Self-pay"
    ? null
    : (
      var.security_account.financial_mode == "Trusteeship" && var.security_account.payer_account_id != null
      ? var.security_account.payer_account_id
      : data.alicloud_account.current_account.id
    )
  )

  ops_account_prefix = (
    var.ops_account.account_name_prefix != null
  ) ? var.ops_account.account_name_prefix : var.ops_account.name

  ops_account_payer_account_id = (
    var.ops_account.financial_mode == "Self-pay"
    ? null
    : (
      var.ops_account.financial_mode == "Trusteeship" && var.ops_account.payer_account_id != null
      ? var.ops_account.payer_account_id
      : data.alicloud_account.current_account.id
    )
  )
}

resource "alicloud_resource_manager_account" "log_archive" {
  count = var.log_archive_account.name != null ? 1 : 0

  display_name          = var.log_archive_account.name
  account_name_prefix   = local.log_archive_account_prefix
  folder_id             = alicloud_resource_manager_folder.core.id
  payer_account_id      = local.log_archive_account_payer_account_id
  abandon_able_check_id = var.log_archive_account.abandon_able_check_id
}

resource "alicloud_resource_manager_account" "shared_services" {
  count = var.shared_services_account.name != null ? 1 : 0

  display_name          = var.shared_services_account.name
  account_name_prefix   = local.shared_services_account_prefix
  folder_id             = alicloud_resource_manager_folder.core.id
  payer_account_id      = local.shared_services_account_payer_account_id
  abandon_able_check_id = var.shared_services_account.abandon_able_check_id
}

resource "alicloud_resource_manager_account" "security" {
  count = var.security_account.name != null ? 1 : 0

  display_name          = var.security_account.name
  account_name_prefix   = local.security_account_prefix
  folder_id             = alicloud_resource_manager_folder.core.id
  payer_account_id      = local.security_account_payer_account_id
  abandon_able_check_id = var.security_account.abandon_able_check_id
}

resource "alicloud_resource_manager_account" "ops" {
  count = var.ops_account.name != null ? 1 : 0

  display_name          = var.ops_account.name
  account_name_prefix   = local.ops_account_prefix
  folder_id             = alicloud_resource_manager_folder.core.id
  payer_account_id      = local.ops_account_payer_account_id
  abandon_able_check_id = var.ops_account.abandon_able_check_id
}
