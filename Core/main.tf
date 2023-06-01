# Get the current client configuration from the AzureRM provider.

data "azurerm_client_config" "current" {}

# Declare the Azure landing zones Terraform module
# and provide the core configuration.

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
  root_name      = local.root_name
  library_path   = "${path.module}/lib"

  default_location = local.default_location

  # Enable creation of the core management group hierarchy
  # and additional custom_landing_zones
  deploy_core_landing_zones = local.deploy_core_landing_zones
  custom_landing_zones      = local.custom_landing_zones

  # Configuration settings for identity resources is
  # bundled with core as no resources are actually created
  # for the identity subscription
  deploy_identity_resources    = local.deploy_identity_resources
  configure_identity_resources = local.configure_identity_resources
  subscription_id_identity     = local.subscription_id_identity

}
