resource "azurerm_resource_group" "create_resource_group" {
  name     = var.resource_group_name
  location = var.location
 
      tags = {
        Environment = var.Environment
        Application = var.Application
        CreatedBy = var.CreatedBy
        CreatedDate = var.CreatedDate
        CreatedThrough = var.CreatedThrough
    }
   
}