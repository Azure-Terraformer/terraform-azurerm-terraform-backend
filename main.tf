resource "azurerm_resource_group" "main" {
  name     = "rg-${var.name}"
  location = var.location
  tags     = var.tags
}

resource "random_string" "storage_suffix" {
  length  = var.random_length
  upper   = false
  special = false
}

resource "azurerm_storage_account" "main" {
  name                     = "st${var.storage_prefix}${random_string.storage_suffix.result}"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = var.storage_replication_type
  tags                     = var.tags
}

resource "azurerm_storage_container" "tfstate" {
  name                  = var.state_container_name
  storage_account_id    = azurerm_storage_account.main.id
  container_access_type = "private"
}

resource "azurerm_storage_container" "tfplan" {
  name                  = var.plan_container_name
  storage_account_id    = azurerm_storage_account.main.id
  container_access_type = "private"
}
