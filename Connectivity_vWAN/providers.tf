# Configure Terraform to set the required AzureRM provider
# version and features{} block

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.54.0"
    }
  }
  /*backend "local" {
    path = "./connectivity.tfstate"
  }*/
}

# Define the provider configuration

provider "azurerm" {
  features {}

  #subscription_id = var.subscription_id_connectivity
}