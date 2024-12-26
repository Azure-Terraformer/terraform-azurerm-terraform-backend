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
| <a name="input_location"></a> [location](#input\_location) | The Azure region where all resources for the Terraform State backend will be created.<br><br>  **Example:** `eastus`, `westeurope`, `centralus`<br><br>  This variable determines the geographical location of the Resource Group, Storage Account, and Storage Containers, ensuring that resources are provisioned in the desired Azure region. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The base name used for naming Azure resources associated with the Terraform State backend.<br><br>  This name is prefixed to the Azure Resource Group to ensure uniqueness and easy identification of resources.<br><br>  **Example:** If `name` is set to `terraform-state`, the Resource Group will be named `rg-terraform-state`. | `string` | n/a | yes |
| <a name="input_plan_container_name"></a> [plan\_container\_name](#input\_plan\_container\_name) | The name of the Azure Storage Container designated for storing Terraform plan files (`tfplan`).<br><br>  **Default:** `"tfplan"`<br><br>  This container is used to store Terraform plan files, which outline the changes Terraform will apply to your infrastructure. Storing plan files separately can help in auditing and reviewing proposed changes before application.<br><br>  **Naming Considerations:** Ensure that the container name adheres to Azure naming conventions and does not conflict with existing containers. | `string` | `"tfplan"` | no |
| <a name="input_random_length"></a> [random\_length](#input\_random\_length) | The length of the random string appended to the Storage Account name to ensure global uniqueness.<br><br>  **Default:** `8`<br><br>  Azure Storage Account names must be globally unique. This variable controls the length of the random suffix added to the `storage_prefix` and `name` to achieve this uniqueness.<br><br>  **Example:** A `random_length` of `8` might result in a Storage Account name like `sttfa1b2c3d4`. | `number` | `8` | no |
| <a name="input_state_container_name"></a> [state\_container\_name](#input\_state\_container\_name) | The name of the Azure Storage Container designated for storing Terraform state files (`tfstate`).<br><br>  **Default:** `"tfstate"`<br><br>  This container holds the state files that track the current state of your Terraform-managed infrastructure, enabling Terraform to manage resources effectively and maintain consistency across deployments.<br><br>  **Naming Considerations:** Ensure that the container name adheres to Azure naming conventions and does not conflict with existing containers. | `string` | `"tfstate"` | no |
| <a name="input_storage_prefix"></a> [storage\_prefix](#input\_storage\_prefix) | A prefix added to the Storage Account names to ensure uniqueness and to follow naming conventions. The prefix is followed by a random string.<br><br>  This prefix helps in distinguishing Azure Storage Accounts intended to be used for Terraform State from other Storage Accounts within the same Azure environment.<br><br>  **Example:** With a `storage_prefix` of `"tf"`, the Storage Account might be named `"tfstorage"`. | `string` | `"tf"` | no |
| <a name="input_storage_replication_type"></a> [storage\_replication\_type](#input\_storage\_replication\_type) | The replication strategy for the Azure Storage Account used by Terraform.<br><br>  **Default:** `"LRS"`<br><br>  This setting determines how data is replicated to ensure durability and availability. Available options include:<br><br>    - **LRS (Locally-Redundant Storage):** Replicates data three times within a single data center.<br>    - **GRS (Geo-Redundant Storage):** Replicates data to a secondary region for disaster recovery.<br>    - **ZRS (Zone-Redundant Storage):** Replicates data across multiple availability zones within the primary region.<br><br>  Choose the replication type based on your redundancy and availability requirements. | `string` | `"LRS"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to all resources created by this module.<br><br>  **Default:** `{}` (no tags)<br><br>  Tags are key-value pairs that help organize and categorize Azure resources. They can be used for various purposes such as cost management, automation, and access control.<br><br>  **Example:**<pre>hcl<br>    tags = {<br>      Environment = "Production"<br>      Project     = "Infrastructure"<br>    }</pre>**Best Practices:**<br><br>    - Use consistent naming conventions for tag keys and values.<br>    - Apply tags uniformly across all resources for easier management. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backend_config"></a> [backend\_config](#output\_backend\_config) | A consolidated map containing the backend configuration details for the Terraform State backend.<br><br>  Structure:<br>    - **resource\_group\_name** (string): The name of the Azure Resource Group where the storage account resides.<br>    - **storage\_account\_name** (string): The name of the Azure Storage Account used to store Terraform state and plan files.<br>    - **state\_container\_name** (string): The name of the Azure Storage Container specifically for Terraform state files (`tfstate`).<br>    - **plan\_container\_name** (string): The name of the Azure Storage Container specifically for Terraform plan files (`tfplan`).<br><br>  This map provides all necessary information for Terraform to configure the backend, ensuring that state and plan files are stored securely and consistently. |
| <a name="output_plan_container_name"></a> [plan\_container\_name](#output\_plan\_container\_name) | The name of the Azure Storage Container designated for storing Terraform plan files (`tfplan`).<br><br>  This container is used to store Terraform plan files, which outline the changes Terraform will apply to your infrastructure. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The name of the Azure Resource Group where the Terraform State backend resources are provisioned.<br><br>  This resource group hosts the storage account and containers used to store Terraform state and plan files securely. |
| <a name="output_state_container_name"></a> [state\_container\_name](#output\_state\_container\_name) | The name of the Azure Storage Container designated for storing Terraform state files (`tfstate`).<br><br>  This container holds the state files that track the current state of your infrastructure, enabling Terraform to manage resources effectively. |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | The name of the Azure Storage Account used to store Terraform state and plan files.<br><br>  This storage account is essential for maintaining the state of your Terraform-managed infrastructure and ensuring consistency across deployments. |
<!-- END_TF_DOCS -->