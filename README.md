This Terraform module provisions an **Azure Storage Account** within a specified **Resource Group**, creating two dedicated **Storage Containers**: one for storing Terraform state files (`tfstate`) and another for Terraform plan files (`tfplan`). By separating state and plan files, the module ensures organized and secure management of your infrastructure's state, facilitating better collaboration and auditing. The module allows for customizable naming conventions, replication types, and tagging, enabling seamless integration with your existing Azure environment and adherence to organizational standards. This setup enhances the reliability and maintainability of your Terraform workflows by providing a robust backend for state management and plan storage.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 4.10.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 4.10.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_storage_account.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.tfplan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [azurerm_storage_container.tfstate](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [random_string.storage_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_plan_container_name"></a> [plan\_container\_name](#input\_plan\_container\_name) | n/a | `string` | `"tfplan"` | no |
| <a name="input_random_length"></a> [random\_length](#input\_random\_length) | n/a | `number` | `8` | no |
| <a name="input_state_container_name"></a> [state\_container\_name](#input\_state\_container\_name) | n/a | `string` | `"tfstate"` | no |
| <a name="input_storage_prefix"></a> [storage\_prefix](#input\_storage\_prefix) | n/a | `string` | `"tf"` | no |
| <a name="input_storage_replication_type"></a> [storage\_replication\_type](#input\_storage\_replication\_type) | n/a | `string` | `"LRS"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backend_config"></a> [backend\_config](#output\_backend\_config) | n/a |
| <a name="output_plan_container_name"></a> [plan\_container\_name](#output\_plan\_container\_name) | n/a |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | n/a |
| <a name="output_state_container_name"></a> [state\_container\_name](#output\_state\_container\_name) | n/a |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | n/a |
<!-- END_TF_DOCS -->