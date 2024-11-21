resource "random_string" "main" {
  length  = var.random_length
  upper   = false
  special = false
}

resource "azurerm_resource_group" "main" {
  name     = "rg-${var.resource_group_prefix}-${random_string.main.result}"
  location = var.location
}

resource "azurerm_storage_account" "main" {
  name                     = "st${var.storage_prefix}${random_string.main.result}"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = var.storage_replication_type
}

resource "azurerm_storage_container" "main" {
  name                  = var.storage_container_name
  storage_account_id    = azurerm_storage_account.main.id
  container_access_type = "private"
}
