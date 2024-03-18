resource "azurerm_windows_virtual_machine" "create_vm" {
    name = var.vm_name
    resource_group_name = var.resource_group_name
    location = var.location
    size = var.vm_size
    admin_username = var.admin_username
    admin_password = var.admin_password
    network_interface_ids = var.network_interface_ids

    source_image_reference {
       publisher = var.vm_image_publisher
       offer = var.vm_image_offer
       sku = var.vm_image_sku
       version = var.vm_image_version
    }

    os_disk {
      storage_account_type = var.vm_os_disk_storage_type
      caching = var.vm_os_disk_caching
    }

}