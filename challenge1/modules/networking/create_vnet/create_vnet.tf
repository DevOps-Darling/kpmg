resource "azurerm_virtual_network" "create_virtual_network" {
  name                = var.virtual_network_name
  address_space       = var.address_space
  location            = var.virtual_network_location
  resource_group_name = var.resource_group_name
}


