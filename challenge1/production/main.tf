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

