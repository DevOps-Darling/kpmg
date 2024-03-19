module "kpmg_resource_group" {
    source = "../modules/platform/create_rg"
    resource_group_name = "RG_KPMG"
    #tags for KPMG resource group
    Environment = "Production"
    Application = "3 Tier Application"
    CreatedBy = "sharad.saxena"
    CreatedDate = "17-03-2024"
    CreatedThrough = "Terraform"
}

module "vpn_vnet" {
    depends_on = [module.kpmg_resource_group]
    source = "../modules/networking/create_vnet"
    virtual_network_name = "VPN_VNET"
    virtual_network_location = "EAST US"
    resource_group_name = [module.kpmg_resource_group.rg_name]
    address_space = ["10.41.1.0/25"]
}

module "vpn_subnet_1" {
    depends_on = [module.vpn_vnet]
    source = "../modules/networking/create_subnet"
    resource_group_name = [module.kpmg_resource_group.rg_name]
    subnet_name = "VPN_SUBNET_1"
    virtual_network_name = [module.vpn_vnet.vnet_name]
    subnet_address_space = ["10.41.1.0/27"]
}
module "fronEnd_nic" {
    depends_on = [module.kpmg_resource_group]
    source = "../modules/networking/create_nic"
    nic_name = "AzrPrdkpmg-nic"
    location = "East US"
    rg_name = [module.kpmg_resource_group.rg_name]
    subnet_id = [module.vpn_subnet_1.subnet_id]
}

module "frontEnd_vm" {
    depends_on = [module.fronEnd_nic]
    source = "../modules/compute/create_vm"
    resource_group_name = module.kpmg_resource_group.rg_name
    location = "EAST US"
    vm_name = "AzrPrdPkpmg"
    vm_size = "Standard_D2ds_v4"
    vm_image_publisher = "MicrosoftWindowsServer"
    vm_image_offer = "WindowsServer"
    vm_image_sku = "2019-Datacenter"
    vm_image_version = "latest"
    vm_os_disk_strorage_type= "Standard_LRS"
    vm_os_disk_caching = "ReadWrite"
    vm_username = "admin"
    vm_password = "admin"
    network_interface_ids = [module.fronEnd_nic.nic_id]
}

module "presentation_tier" {
    depends_on = [module.kpmg_resource_group]
    source = "../modules/storage"
    frontendstoragename = "frontendstorage"
    rg_name = [module.kpmg_resource_group.rg_name]
    location = "EAST US"
    account_replication_type = "LRS"
    account_tier             = "Standard"

}

module "application_tier" {
    source = "../modules/functions"
  name                     = "frontendstorage"
  resource_group_name      = [module.kpmg_resource_group.rg_name]
  location                 = "EAST US"
  key = asdw4ad21
}

