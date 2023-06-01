locals {
  root_parent_id                = coalesce(var.root_parent_id, data.azurerm_client_config.current.tenant_id)
  root_id                       = var.root_id
  default_location              = var.default_location
  subscription_id_connectivity  = coalesce(var.subscription_id_connectivity, data.azurerm_client_config.current.subscription_id)
  deploy_core_landing_zones     = var.deploy_core_landing_zones
  deploy_connectivity_resources = var.deploy_connectivity_resources
}