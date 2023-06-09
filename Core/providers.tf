# Configure Terraform to set the required AzureRM provider
# version and features{} block.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.54.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = var.backend_storage_resource_group_name
    storage_account_name = var.backend_storage_account_name
    container_name       = var.backend_storage_account_container_name
    key                  = var.backend_storage_account_key
  }
}

# Define the provider configuration

provider "azurerm" {
  features {}
}
