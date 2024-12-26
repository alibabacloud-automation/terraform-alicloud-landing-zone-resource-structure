
# Complete

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources. Run `terraform destroy` when you don't need these resources.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_landingzone_resource_structure"></a> [landingzone\_resource\_structure](#module\_landingzone\_resource\_structure) | ../.. | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_core_folder_id"></a> [core\_folder\_id](#output\_core\_folder\_id) | Core folder ID |
| <a name="output_log_account_id"></a> [log\_account\_id](#output\_log\_account\_id) | Log account ID |
| <a name="output_ops_account_id"></a> [ops\_account\_id](#output\_ops\_account\_id) | Ops account ID |
| <a name="output_resource_directory_id"></a> [resource\_directory\_id](#output\_resource\_directory\_id) | Resource Directory ID |
| <a name="output_security_account_id"></a> [security\_account\_id](#output\_security\_account\_id) | Security account ID |
| <a name="output_shared_services_account_id"></a> [shared\_services\_account\_id](#output\_shared\_services\_account\_id) | Shared account ID |
<!-- END_TF_DOCS -->