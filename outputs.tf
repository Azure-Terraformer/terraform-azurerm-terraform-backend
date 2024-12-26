output "resource_group_name" {
  value = azurerm_resource_group.main.name

  description = <<DESCRIPTION
  The name of the Azure Resource Group where the Terraform State backend resources are provisioned.

  This resource group hosts the storage account and containers used to store Terraform state and plan files securely.
  DESCRIPTION
}
output "storage_account_name" {
  value = azurerm_storage_account.main.name

  description = <<DESCRIPTION
  The name of the Azure Storage Account used to store Terraform state and plan files.

  This storage account is essential for maintaining the state of your Terraform-managed infrastructure and ensuring consistency across deployments.
  DESCRIPTION
}
output "state_container_name" {
  value = azurerm_storage_container.tfstate.name

  description = <<DESCRIPTION
  The name of the Azure Storage Container designated for storing Terraform state files (`tfstate`).

  This container holds the state files that track the current state of your infrastructure, enabling Terraform to manage resources effectively.
  DESCRIPTION
}
output "plan_container_name" {
  value = azurerm_storage_container.tfplan.name

  description = <<DESCRIPTION
  The name of the Azure Storage Container designated for storing Terraform plan files (`tfplan`).

  This container is used to store Terraform plan files, which outline the changes Terraform will apply to your infrastructure.
  DESCRIPTION
}
output "backend_config" {
  value = {
    resource_group_name  = azurerm_resource_group.main.name
    storage_account_name = azurerm_storage_account.main.name
    state_container_name = azurerm_storage_container.tfstate.name
    plan_container_name  = azurerm_storage_container.tfplan.name
  }

  description = <<DESCRIPTION
  A consolidated map containing the backend configuration details for the Terraform State backend.

  Structure:
    - **resource_group_name** (string): The name of the Azure Resource Group where the storage account resides.
    - **storage_account_name** (string): The name of the Azure Storage Account used to store Terraform state and plan files.
    - **state_container_name** (string): The name of the Azure Storage Container specifically for Terraform state files (`tfstate`).
    - **plan_container_name** (string): The name of the Azure Storage Container specifically for Terraform plan files (`tfplan`).

  This map provides all necessary information for Terraform to configure the backend, ensuring that state and plan files are stored securely and consistently.
  DESCRIPTION
}
