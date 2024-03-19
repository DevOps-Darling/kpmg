resource "azurerm_function_app" "backend" {
  name                      = var.name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  app_service_plan_id       = azurerm_app_service_plan.presentation_tier.id
  storage_account_name      = azurerm_storage_account.presentation_tier.name
  version                   = "~3"
  storage_account_access_key = var.key
}