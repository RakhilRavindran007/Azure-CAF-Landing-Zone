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
    path = "./management.tfstate"
  }*/
}

# Define the provider configuration

provider "azurerm" {
  features {}

  #subscription_id = data.azurerm_client_config.current.subscription_id # need to modify
}
