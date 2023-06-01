# Configure Terraform to set the required AzureRM provider
# version and features{} block.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.54.0"
    }
  }
  backend "local" {
    path = "./core.tfstate"
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
    azurerm.connectivity = azurerm.connectivity
    azurerm.management   = azurerm.management
  }

  # Base module configuration settings
  root_parent_id   = data.azurerm_client_config.current.tenant_id
  root_id          = local.root_id
  root_name        = local.root_name
  library_path     = "${path.module}/lib"
  default_location = local.default_location

  # Enable creation of the core management group hierarchy
  # and additional custom_landing_zones
  deploy_core_landing_zones = true #local.deploy_core_landing_zones
  custom_landing_zones      = local.custom_landing_zones

  # Configuration settings for identity resources is
  # bundled with core as no resources are actually created
  # for the identity subscription
  deploy_identity_resources    = false #local.deploy_identity_resources
  configure_identity_resources = local.configure_identity_resources
  subscription_id_identity     = local.subscription_id_identity

  # to deploy the demo landing zone which deploys Corp, Online and SAP managmeent groups under Landing zone management group
  # deploy_demo_landing_zones = true
  # The following inputs ensure that managed parameters are
  # configured correctly for policies relating to connectivity
  # resources created by the connectivity module instance and
  # to map the subscription to the correct management group,
  # but no resources are created by this module instance
  #deploy_connectivity_resources    = false #local.deploy_connectivity_resources
  #configure_connectivity_resources = local.configure_connectivity_resources
  #subscription_id_connectivity     = local.subscription_id_connectivity

  # The following inputs ensure that managed parameters are
  # configured correctly for policies relating to management
  # resources created by the management module instance and
  # to map the subscription to the correct management group,
  # but no resources are created by this module instance
  #deploy_management_resources    = false #local.deploy_management_resources
  #configure_management_resources = local.configure_management_resources
  #subscription_id_management     = local.subscription_id_management

}
