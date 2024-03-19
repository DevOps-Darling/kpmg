output "rg_id" {
    description = "value"
    value = azurerm_resource_group.create_resource_group.id
}

output "rg_name" {
  description = "value"
    value = azurerm_resource_group.create_resource_group.name
}