Terraform module to build a multi-account architecture for enterprise.

terraform-alicloud-landing-zone-resource-structure
======================================

English | [简体中文](https://github.com/alibabacloud-automation/terraform-alicloud-landing-zone-resource-structure/blob/main/README-CN.md)

The enterprise-level unified account architecture design is a solution aimed at helping customers quickly set up a multi-account environment based on Alibaba Cloud's best practices. Setting up a multi-account environment can be time-consuming due to the involvement of multiple foundational cloud products, and it requires configuring multiple accounts and services, as well as a deep understanding of the related services.

This module helps customers save time by automatically creating core accounts and resource folders. Additionally, it supports customers in quickly selecting either self-service billing or financial management for more efficient cloud cost management.

Please note that due to the silent period for account deletion within the resource directory, the deletion of resource folders containing such accounts may fail.

![Structure](https://raw.githubusercontent.com/alibabacloud-automation/terraform-alicloud-landing-zone-resource-structure/main/scripts/Structure.png)

## Usage

<div style="display: block;margin-bottom: 40px;"><div class="oics-button" style="float: right;position: absolute;margin-bottom: 10px;">
  <a href="https://api.aliyun.com/terraform?source=Module&activeTab=document&sourcePath=alibabacloud-automation%3A%3Alanding-zone-resource-structure&spm=docs.m.alibabacloud-automation.landing-zone-resource-structure&intl_lang=EN_US" target="_blank">
    <img alt="Open in AliCloud" src="https://img.alicdn.com/imgextra/i1/O1CN01hjjqXv1uYUlY56FyX_!!6000000006049-55-tps-254-36.svg" style="max-height: 44px; max-width: 100%;">
  </a>
</div></div>

Use Terraform to enable the resource directory and create core accounts and resource folders, and select the financial settlement method.

```hcl
provider "alicloud" {
  region = "cn-hangzhou"
}

module "landingzone_resource_structure" {
  source = "alibabacloud-automation/landing-zone-resource-structure/alicloud"

  enable_resource_directory = true
  core_folder_name          = "Core"

  log_archive_account = {
    name                  = "MyLogArchiveAccount"
    account_name_prefix   = "my-log-prefix"
    abandon_able_check_id = ["SP_fc_fc"]
    financial_mode = "Trusteeship"
  }

  shared_services_account = {
    name                  = "MySharedServicesAccount"
    abandon_able_check_id = ["SP_fc_fc"]
    financial_mode = "Self-pay"
  }
}
```

## Examples

- [Complete Example](https://github.com/alibabacloud-automation/terraform-alicloud-landing-zone-resource-structure/tree/main/examples/complete)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_resource_manager_account.log_archive](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/resource_manager_account) | resource |
| [alicloud_resource_manager_account.ops](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/resource_manager_account) | resource |
| [alicloud_resource_manager_account.security](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/resource_manager_account) | resource |
| [alicloud_resource_manager_account.shared_services](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/resource_manager_account) | resource |
| [alicloud_resource_manager_folder.core](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/resource_manager_folder) | resource |
| [alicloud_resource_manager_resource_directory.master](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/resource_manager_resource_directory) | resource |
| [alicloud_account.current_account](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_core_folder_name"></a> [core\_folder\_name](#input\_core\_folder\_name) | The name of the core folder, used to store core accounts. | `string` | `"Core"` | no |
| <a name="input_enable_resource_directory"></a> [enable\_resource\_directory](#input\_enable\_resource\_directory) | Whether to enable the resource directory. Set to true to enable, false to skip. | `bool` | `true` | no |
| <a name="input_log_archive_account"></a> [log\_archive\_account](#input\_log\_archive\_account) | Log archive account:<br/>- name: if null/empty => not created (though typically this one is mandatory).<br/>- account\_name\_prefix: if empty, fallback to name.<br/>- abandon\_able\_check\_id: list of strings to ignore on deletion.<br/>- financial\_mode: choose between "Trusteeship" and "Self-pay". Default is "Trusteeship".<br/>- payer\_account\_id: the payer account ID if using financial hosting. If not provided, use current account ID. | <pre>object({<br/>    name                  = string<br/>    account_name_prefix   = optional(string, null)<br/>    abandon_able_check_id = optional(list(string), [])<br/>    financial_mode        = optional(string, "Trusteeship")<br/>    payer_account_id      = optional(string, null)<br/>  })</pre> | <pre>{<br/>  "financial_mode": "Trusteeship",<br/>  "name": "DefaultLogArchiveAccount"<br/>}</pre> | no |
| <a name="input_ops_account"></a> [ops\_account](#input\_ops\_account) | Ops account:<br/>- name: if null/empty => not created<br/>- account\_name\_prefix: if empty => fallback to name<br/>- abandon\_able\_check\_id: list of strings to ignore on deletion<br/>- financial\_mode: choose between "Trusteeship" and "Self-pay". Default is "Trusteeship".<br/>- payer\_account\_id: the payer account ID if using financial hosting. If not provided, use current account ID. | <pre>object({<br/>    name                  = string<br/>    account_name_prefix   = optional(string, null)<br/>    abandon_able_check_id = optional(list(string), [])<br/>    financial_mode        = optional(string, "Trusteeship")<br/>    payer_account_id      = optional(string, null)<br/>  })</pre> | <pre>{<br/>  "name": null<br/>}</pre> | no |
| <a name="input_security_account"></a> [security\_account](#input\_security\_account) | Security account:<br/>- name: if null/empty => not created<br/>- account\_name\_prefix: if empty => fallback to name<br/>- abandon\_able\_check\_id: list of strings to ignore on deletion<br/>- financial\_mode: choose between "Trusteeship" and "Self-pay". Default is "Trusteeship".<br/>- payer\_account\_id: the payer account ID if using financial hosting. If not provided, use current account ID. | <pre>object({<br/>    name                  = string<br/>    account_name_prefix   = optional(string, null)<br/>    abandon_able_check_id = optional(list(string), [])<br/>    financial_mode        = optional(string, "Trusteeship")<br/>    payer_account_id      = optional(string, null)<br/>  })</pre> | <pre>{<br/>  "name": null<br/>}</pre> | no |
| <a name="input_shared_services_account"></a> [shared\_services\_account](#input\_shared\_services\_account) | Shared services account:<br/>- name: if null/empty => not created<br/>- account\_name\_prefix: if empty => fallback to name<br/>- abandon\_able\_check\_id: list of strings to ignore on deletion<br/>- financial\_mode: choose between "Trusteeship" and "Self-pay". Default is "Trusteeship".<br/>- payer\_account\_id: the payer account ID if using financial hosting. If not provided, use current account ID. | <pre>object({<br/>    name                  = string<br/>    account_name_prefix   = optional(string, null)<br/>    abandon_able_check_id = optional(list(string), null)<br/>    financial_mode        = optional(string, "Trusteeship")<br/>    payer_account_id      = optional(string, null)<br/>  })</pre> | <pre>{<br/>  "name": null<br/>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_core_folder_id"></a> [core\_folder\_id](#output\_core\_folder\_id) | The ID of the core folder |
| <a name="output_log_account_id"></a> [log\_account\_id](#output\_log\_account\_id) | The ID of the log account (if created) |
| <a name="output_ops_account_id"></a> [ops\_account\_id](#output\_ops\_account\_id) | The ID of the ops account (if created) |
| <a name="output_resource_directory_id"></a> [resource\_directory\_id](#output\_resource\_directory\_id) | The ID of the Resource Directory |
| <a name="output_security_account_id"></a> [security\_account\_id](#output\_security\_account\_id) | The ID of the security account (if created) |
| <a name="output_shared_services_account_id"></a> [shared\_services\_account\_id](#output\_shared\_services\_account\_id) | The ID of the shared services account (if created) |
<!-- END_TF_DOCS -->
## Submit Issues

If you have any problems when using this module, please opening a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend opening an issue on this repo.

## Authors

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## License

MIT Licensed. See LICENSE for full details.

## Reference

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
