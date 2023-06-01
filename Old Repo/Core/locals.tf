# The following locals are used to convert provided input variables to locals 
# before use elsewhere in the module.

locals {
  root_id                          = var.root_id
  root_name                        = var.root_name
  default_location                 = var.primary_location
  deploy_core_landing_zones        = var.deploy_core_landing_zones
  deploy_identity_resources        = var.deploy_identity_resources
  deploy_management_resources      = var.deploy_management_resources
  deploy_connectivity_resources    = var.deploy_connectivity_resources
  configure_connectivity_resources = var.configure_connectivity_resources
  configure_management_resources   = var.configure_management_resources

  #security_contact_email_address = var.security_contact_email_address
  subscription_id_management   = coalesce(var.subscription_id_management, data.azurerm_client_config.current.subscription_id)
  subscription_id_connectivity = coalesce(var.subscription_id_connectivity, local.subscription_id_management)
  subscription_id_identity     = coalesce(var.subscription_id_identity, local.subscription_id_management)
}
