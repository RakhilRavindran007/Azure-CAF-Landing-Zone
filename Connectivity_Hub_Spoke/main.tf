# Get the current client configuration from the AzureRM provider

data "azurerm_client_config" "current" {}

# Declare the Azure landing zones Terraform module
# and provide the connectivity configuration

module "alz" {
  source = "../terraform-azurerm-caf-enterprise-scale"
  #source  = "Azure/caf-enterprise-scale/azurerm"
  #version = "<version>" # change this to your desired version, https://www.terraform.io/language/expressions/version-constraints

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  # Base module configuration settings
  root_parent_id = local.root_parent_id
  root_id        = local.root_id

  # Disable creation of the core management group hierarchy
  # as this is being created by the core module instance
  deploy_core_landing_zones = local.deploy_core_landing_zones
  default_location          = local.default_location

  # Configuration settings for connectivity resources
  deploy_connectivity_resources    = local.deploy_connectivity_resources
  configure_connectivity_resources = local.configure_connectivity_resources
  subscription_id_connectivity     = local.subscription_id_connectivity

}
