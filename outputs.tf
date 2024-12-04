output "resource_group_name" {
  value = azurerm_resource_group.main.name
}
output "storage_account_name" {
  value = azurerm_storage_account.main.name
}
output "state_container_name" {
  value = azurerm_storage_container.tfstate.name
}
output "plan_container_name" {
  value = azurerm_storage_container.tfplan.name
}
output "backend_config" {
  value = {
    resource_group_name  = azurerm_resource_group.main.name
    storage_account_name = azurerm_storage_account.main.name
    state_container_name = azurerm_storage_container.tfstate.name
    plan_container_name  = azurerm_storage_container.tfplan.name
  }
}
