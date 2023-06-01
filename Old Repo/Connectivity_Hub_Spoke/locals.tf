# The following locals are used to convert provided input variables to locals 
# before use elsewhere in the module.

locals {
  root_id                          = var.root_id
  root_name                        = var.root_name
  default_location                 = var.primary_location
  deploy_connectivity_resources    = var.deploy_connectivity_resources
  #security_contact_email_address = var.security_contact_email_address
  subscription_id_connectivity = coalesce(var.subscription_id_connectivity, data.azurerm_client_config.current.subscription_id)
}
