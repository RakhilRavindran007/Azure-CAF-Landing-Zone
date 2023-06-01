locals {
  root_parent_id                = coalesce(var.root_parent_id, data.azurerm_client_config.current.tenant_id)
  root_id                       = var.root_id
  root_name                     = var.root_name
  default_location              = var.default_location
  subscription_id_management    = coalesce(var.subscription_id_management, data.azurerm_client_config.current.subscription_id) 
  deploy_core_landing_zones     = var.deploy_core_landing_zones
  deploy_management_resources   = var.deploy_management_resources
}
