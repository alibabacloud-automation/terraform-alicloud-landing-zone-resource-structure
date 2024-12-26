provider "alicloud" {
  region = "cn-hangzhou"
}

module "landingzone_resource_structure" {
  source = "../.."

  enable_resource_directory = true
  core_folder_name          = "Core"

  log_archive_account = {
    name                  = "MyLogArchiveAccount"
    account_name_prefix   = "my-log-prefix"
    abandon_able_check_id = ["SP_fc_fc"]
    financial_mode        = "Trusteeship"
  }

  shared_services_account = {
    name                  = "MySharedServicesAccount"
    abandon_able_check_id = ["SP_fc_fc"]
    financial_mode        = "Self-pay"
  }
}
