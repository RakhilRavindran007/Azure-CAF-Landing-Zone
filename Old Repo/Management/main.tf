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

provider "azurerm" {
  features {}
}

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
  default_location = "westeurope"

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_parent_id = data.azurerm_client_config.current.tenant_id
  root_id        = var.root_id
  root_name      = var.root_name

  deploy_management_resources    = var.deploy_management_resources
  subscription_id_management     = data.azurerm_client_config.current.subscription_id
  configure_management_resources = local.configure_management_resources
}