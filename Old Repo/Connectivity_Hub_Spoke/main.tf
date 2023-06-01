# Configure Terraform to set the required AzureRM provider
# version and features{} block.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.54.0"
    }
  }
}

# Define the provider configuration


# Get the current client configuration from the AzureRM provider.

data "azurerm_client_config" "current" {}

# Declare the Azure landing zones Terraform module
# and provide the core configuration.

module "alz" {
  # To enable correct testing of our examples, we must source this
  # module locally. Please remove the local `source = "../../../"`
  # and uncomment the remote `source` and `version` below.
  source = "../terraform-azurerm-caf-enterprise-scale"
  # source  = "Azure/caf-enterprise-scale/azurerm"
  # version = "3.1.2"

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  # Base module configuration settings
  root_parent_id   = data.azurerm_client_config.current.tenant_id
  root_id          = local.root_id
  root_name        = local.root_name
 
  default_location = local.default_location


  # The following inputs ensure that managed parameters are
  # configured correctly for policies relating to connectivity
  # resources created by the connectivity module instance and
  # to map the subscription to the correct management group,
  # but no resources are created by this module instance
  deploy_connectivity_resources    = local.deploy_connectivity_resources
  configure_connectivity_resources = local.configure_connectivity_resources
  subscription_id_connectivity     = local.subscription_id_connectivity

}
